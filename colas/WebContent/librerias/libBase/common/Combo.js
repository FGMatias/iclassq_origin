/**
 * combo paginado
 **/
Ext.define('componente.ComboPaginado', {
	extend : 'Ext.form.field.ComboBox',
	alias : 'widget.ComboPaginado',
	parametros : null,
	setUrl:function(url){
		this.parametros.url=url;
	},
	getUrl:function(){
	return this.parametros.url;
	},
	path : '',
	initComponent : function() {

		var definicion=this.definicion || 'ModelComboPagin'+Ext.id();
		var eventLoad=this.eventLoad;
		var eventBeforeLoad=this.eventBeforeLoad;
		var url=this.url;
		var root=this.root;
		var total=this.total;
		var type=this.typeAhead || 'ajax';
		var fields=this.fields;
		var path=this.path;
		var method=this.method;
	
		
		var mt='GET';
		
		if(method){
		
			mt=method;
		}
		
		var extraParams=this.extraParams;
		
		Ext.define(definicion, {
	        extend: 'Ext.data.Model',
	        proxy: {
	            type: type,
	            headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8','Accept' : 'application/json, text/javascript, */*; q=0.01'},
	            url : path+url ,
	            actionMethods :mt,
	            extraParams:extraParams,
	            reader: {
	                type: 'json',
	                root: root,
	                totalProperty: total
	            }
	        },

	        fields: fields

	    });

	    var pageSize=this.pageSize;
	    var ds = Ext.create('Ext.data.Store', {
	        pageSize: pageSize ||10,
	        model: definicion,
	        listeners:{
	        	load: eventLoad || function(){
	        	
	        	},beforeload: eventBeforeLoad|| function( store, operation, eOpts){
	        	}
	        
	        }
	    });
	    this.store = ds;
        this.callParent(arguments);
	}

});


var ComboSelectPaginComponent={

	
	create:function(config){
	
	var definicion= config.definicion || 'ModelComboPagin'+Ext.id();
	var eventLoad= config.eventLoad;
	var eventBeforeLoad= config.eventBeforeLoad;
	var url= config.url;
	var root= config.root;
	var total= config.total;
	var type= config.typeAhead || 'ajax';
	var fields= config.fields;
	var path= config.path || '';
		
	var extraParams=config.extraParams;
		
		Ext.define(definicion, {
	        extend: 'Ext.data.Model',
	        proxy: {
	            type: type,
	            headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8','Accept' : 'application/json, text/javascript, */*; q=0.01'},
	            url : path+url ,
	            extraParams:extraParams,
	            reader: {
	                type: 'json',
	                root: root,
	                totalProperty: total
	            }
	        },

	        fields: fields

	    });
	    
	    var pageSize=config.pageSize;
	    var ds = Ext.create('Ext.data.Store', {
	        pageSize: pageSize ||10,
	        model: definicion,
	        listeners:{
	        	load: eventLoad || function(){
	        	
	        	},beforeload: eventBeforeLoad|| function(){
	        	}
	        
	        }
	    });
	    
        var fieldCmp = Ext.create('Ext.ux.form.field.BoxSelect', Ext.applyIf({
            store: ds
        }, config));
		
    
        
        return fieldCmp;
	
	}

}




/**
 * combo
 **/
Ext.define('componente.ComboCustomized', {
	extend : 'Ext.form.field.ComboBox',
	alias : 'widget.ComboCustomized',
	parametros : null,
	setUrl:function(url){
		this.parametros.url=url;
	},
	getUrl:function(){
	return this.parametros.url;
	},
	path : '',
	removePresentvalue : function(array, indexRecord, hiddenvalues) {
		var arrayNew = new Array();

		Ext.each(hiddenvalues, function(value) {

					for (var i = 0; i < array.length; i++) {

						if (array[i][indexRecord] + '' != value + '') {

							arrayNew.push(array[i]);

						}

					}

				});

		return arrayNew;

	},
	loadDatos : function(params, callback,arrayHiden) {
		try{
			
		var store = this.store;
		var addText = this.parametros.addText;
		var field = this;
		var addRecordsExtra=this.parametros.addRecordsExtra;
		var hiddenValue = arrayHiden || this.parametros.hiddenValue || [];

		var removePresentvalue = this.removePresentvalue;
		var indexRecord = 'IDELEMENTO';
		if (this.parametros.record) {
			//indexRecord = this.parametros.record.value;
		if(this.parametros.record.fields){
				indexRecord = this.valueField;
			}else{
				indexRecord = this.parametros.record.value;
			}
		}
		
		Util.Ajax.genericAjaxExt4({
			url : this.parametros.url || '../index.php/catalogo/GetElementosByGrupo',
			async : this.parametros.async || true,
			method : this.parametros.method || 'GET',
			callback : callback || this.parametros.callback,
			success : function(respuesta) {
				var response = Ext.decode(respuesta.responseText);

				var arr_data = [];

				if (addText) {
					arr_data.push({
								IDELEMENTO : '',
								NOMBRE : addText
							});
				}
				
				if(addRecordsExtra){
				
					Ext.each(addRecordsExtra,function(item){
					
						arr_data.push(item);
					});
				
				}
				
				Ext.each((response.data.data?response.data.data:response.data), function(catalogo, i) {

							arr_data.push(catalogo);	

				});
						
				field.clearValue();
				store.removeAll();
				var temp = hiddenValue;
				var array = new Array();
				if (temp.length > 0) {
					array = removePresentvalue(arr_data, indexRecord, [temp[0]]);

					for (var index = 1; index < temp.length; index++) {
						array = removePresentvalue(array, indexRecord,
								[temp[index]]);
					}

				} else {
					array = arr_data;
				}

				store.loadData(array);

			},
			params : params

		});
		}catch(e){
		}

	},
	initComponent : function() {
		
		var addRecordsExtra=this.parametros.addRecordsExtra;
		
		if (this.parametros.record) {

			if(this.parametros.record.fields){
				
						Ext.regModel('recordCombo', {
						fields : this.parametros.record.fields
					});
				
			}else{
			Ext.regModel('recordCombo', {
						fields : [{
									name : this.parametros.record.value + '',
									mapping : this.parametros.record.value + ''
								}, {
									name : this.parametros.record.text + '',
									mapping : this.parametros.record.text + ''
								}]
					});
			}	

		} else {
			Ext.regModel('recordCombo', {
						fields : [{
									name : 'IDELEMENTO',
									mapping : 'IDELEMENTO'
								}, {
									name : 'NOMBRE',
									mapping : 'NOMBRE'
								}]
					});
		}
		var store = Ext.create('Ext.data.Store', {
					model : 'recordCombo',
					data : []
				});
				
		var addText = this.parametros.addText;
		var addTextRecord = this.parametros.addTextRecord;
		var params = this.parametros.params;
		var hiddenValue = this.parametros.hiddenValue || [];
		var removePresentvalue = this.removePresentvalue;
		var indexRecord = 'IDELEMENTO';
		
			if (this.parametros.record) {
            if(this.parametros.record.fields){
				
                indexRecord = this.valueField;
				
            }else{
                indexRecord = this.parametros.record.value;
            }
			
        }
		
		var callback=this.parametros.callback;
		
		Util.Ajax.genericAjaxExt4({

			url : this.parametros.url || '../index.php/catalogo/GetElementosByGrupo',
			async : this.parametros.async || true,
			method : this.parametros.method || 'GET',
			callback : callback,
			success : function(respuesta) {
				var response = Ext.decode(respuesta.responseText);

				var arr_data = [];

				
				if(addTextRecord){
					
					arr_data.push(addTextRecord);
					
				}else{
					
					if (addText) {
						
						arr_data.push({
							IDELEMENTO : '',
							NOMBRE : addText
						});
						
					}
					
				}
				
			
				
				if(addRecordsExtra){
				
					Ext.each(addRecordsExtra,function(item){
					
						arr_data.push(item);
					});
				
				}
				Ext.each((response.data.data?response.data.data:response.data), function(catalogo, i) {

							arr_data.push(catalogo);

						});

				var temp = hiddenValue;
				var array = new Array();
				if (temp.length > 0) {
					array = removePresentvalue(arr_data, indexRecord, [temp[0]]);

					for (var index = 1; index < temp.length; index++) {
						array = removePresentvalue(array, indexRecord,
								[temp[index]]);
					}

				} else {
					array = arr_data;
				}

				store.loadData(array);
			

			},
			params : params

		});

		this.store = store;

		this.callParent(arguments);
	}

});


/** Combo Group **/

Ext.define('componente.GroupingComboBox', {

    extend: 'Ext.form.field.ComboBox',
    alias: 'widget.ComboAgrupado',

    constructor: function (args) {
        var me = this,
            groupField = args.groupField || "group",
            groupDisplayField = args.groupDisplayField || groupField,
            displayField = args.displayField || "name";

        args.tpl = new Ext.XTemplate(
            '<tpl for=".">',
            '<tpl if="this.' + groupField + ' != values.' + groupField + '">',
            '<tpl exec="this.' + groupField + ' = values.' + groupField + '"></tpl>',
            '<div class="x-panel-header-default x-panel-header-text-container x-panel-header-text x-panel-header-text-default" title="{' + groupDisplayField + '}">{' + groupDisplayField + '}</div>',
            '</tpl>',
            '<div class="x-boundlist-item">{' + displayField + '}</div>',
            '</tpl>'
        );

        me.callParent(arguments);
    }
});



