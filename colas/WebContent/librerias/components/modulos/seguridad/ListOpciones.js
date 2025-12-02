Ext.define('seguridad.ListOpciones', {
	extend : 'Ext.panel.Panel',
	alias : 'widget.listOpciones',
	initComponent : function() {
		var filters = {
    	        ftype: 'filters',
    	        	 encode: true, // json encode the filter query
    	             local: true,
    	    };
		
		var rowEditing = Ext.create('Ext.grid.plugin.RowEditing', {
	        clicksToMoveEditor: 2,
	        autoCancel: false,
	         listeners:{
       	 edit:function(editor, e, eOpts){

       		 var opcion=new Object();
       		 opcion.vOpcionNombre=e.record.data.vOpcionNombre;
       		 opcion.vOpcionAction=e.record.data.vOpcionAction;
       		 opcion.iOpcionIndpadre=e.record.data.iOpcionIndpadre;
       		
       		 if(e.record.data.iOpcionId){
       			 opcion.iOpcionId=e.record.data.iOpcionId;
       		 }
       		 
       		 if(!(e.newValues.vOpcionNombre==e.originalValues.vOpcionNombre 
       			&& e.newValues.vOpcionAction==e.originalValues.vOpcionAction
       			&& e.newValues.desPadre==e.originalValues.desPadre)){
       		
	        		 Ext.getCmp(me.id+'_grid').body.mask('Procesando la Solicitud. Espere un momento por favor.');
	        		 new Util.Ajax.runAjax({
	          				url : 'saveopcion.app',
	          				method : 'POST',
	          				async : true,
	          				params : opcion
	          				,success:function(result){
	          					var response=Ext.decode(result.responseText);
	          					Ext.getCmp(me.id+'_grid').body.unmask();
	          					if(response.success){
	          						var msg=response.message;
	          						Util.UiMessageBox({msg:msg,title:'Mensaje'});
	          						e.record.set('iOpcionId',response.data.iOpcionId);
	          						e.record.commit();
	          					}else{
	          						e.record.set('vOpcionNombre',e.originalValues.vOpcionNombre);
	          						e.record.set('vOpcionAction',e.originalValues.vOpcionAction);
	          						e.record.set('desPadre',e.originalValues.desPadre);
	          						e.record.commit();
	          						Util.UiMessageBox({msg:response.message,title:'Error',iconClsAceptar:'cancel_24'});
	          					}
	          				}
	          			});
       		 }
       	 }
        }
	    });
		
		function rowStyle(v){
			return (v?v:'');
			}

		
		Ext.define('OpcionesComboBox', {
	        extend: 'Ext.data.Model', 
	        fields : [
						{name : "iOpcionId"},
						{name : "vOpcionNombre"}
				]
	 });

	 var opcionesComboBoxStore= Ext.create('Ext.data.Store', {
	     model: 'OpcionesComboBox',
	     proxy: {
	         type: 'ajax',
	         url: 'findallopciones.app',
	         reader: {
	             type: 'json',
	             root: 'data'
	         },
	         extraParams:{withRoot:true}
	     }
	 });
		
		var me=this;
    	this.border=false;	
    	this.items={
    			

            	xtype:'sireGrid'
            	,width: 539
            	,features:[filters]
            	,border:false
            	,id:me.id+'_grid'
            	,bodyStyle:'background:#fff;padding:0px;'
            	,nameModel:'Rol'
            	,fields:[{
    		        name: 'iOpcionId',
    		        type: 'int'
    		    }, {
    		        name: 'vOpcionNombre'
    		    }, {
    		        name: 'vOpcionAction'
    		    }, {
    		    	name:'esPadre'
    		    }, {
    		    	name:'numHijos'
    		    }, {
    		    	name:'desPadre'
    		    }, {
    		    	name:'iOpcionIndpadre'
    		    }
    		    
    		    ]
    		,sorters:[{
                property: 'iOpcionId',
                direction: 'DESC'
            }]
            ,readerStore:{
                type: 'json',
                root: 'data',
                idProperty: 'iOpcionId'
            }
            ,loadStore:true
            ,url:'findallopciones.app'
            ,plugins:[rowEditing]
            ,columns: [
					{
						text:'ID Opcion',
					    dataIndex: 'iOpcionId',
					    width: 80,
					    align:'center',
					    renderer:rowStyle,
					    filterable: true,
			            filter: {type: 'numeric'}
					}
					,
					{
						text:'Nombre Opcion',
					    dataIndex: 'vOpcionNombre',
					    flex: 1,
					    renderer:rowStyle,
					    editor:{
					    	xtype:'textfield',
					    	fieldStyle:'background:#fff;',
					    	blankText : 'Ingrese el nombre de la opcion',
					    	allowBlank:false
					    },
			            filter: {
			                type: 'string'
			            }
					}
					,
					{
						text:'Accion',
					    dataIndex: 'vOpcionAction',
					    flex: 1,
					    renderer:rowStyle,
					    editor:{
					    	xtype:'textfield',
					    	fieldStyle:'background:#fff;',
					    	blankText : 'Ingrese la accion de la opcion',
					    	allowBlank:false
					    },
			            filter: {
			                type: 'string'
			            }
					},
					{
						text:'ID Padre',
					    dataIndex: 'iOpcionIndpadre',
					    hidden:true,
					    width: 70
					},
					{
						text:'Padre',
					    dataIndex: 'desPadre',
					    flex: 1,
					    renderer:rowStyle,
					    editor:{
					    		  xtype: 'combobox',
					    		  store: opcionesComboBoxStore,
					    		  displayField: 'vOpcionNombre',
					    		  valueField: 'vOpcionNombre',
					    		  queryMode: 'remote',
					    		  forceSelection : true,
					    		  allowBlank : false,
								  blankText : 'Seleccione una opcion',
					    		  queryParam: 'vOpcionNombre' ,
									listeners : {
									select : function(field,record,c) {
										var grid=Ext.getCmp(me.id+'_grid');
										var row=grid.getSelectionModel().getSelection()[0];
										var iOpcionId=record[0].data.iOpcionId;
										console.log(row.data.iOpcionId);
										if(row.data.iOpcionId+''!=''+iOpcionId){
											row.set('iOpcionIndpadre',iOpcionId);
										}else{
											field.reset();
											Util.UiMessageBox({msg:'Una opcion no puede ser padre de si misma.',title:'Error',iconClsAceptar:'cancel_24'});
										}
									}
								},
								listConfig : {
									getInnerTpl : function() {
										return '<div style="padding:2px;">{vOpcionNombre}</div>';
									}
								}

		                },
			            filter: {
			                type: 'string'
			            }
					}
					,{
						header : "&nbsp;",
			            xtype: 'actioncolumn',
			            width:20,
			            align:'center',
			            sortable: false,
			            items : [{
						icon : 'librerias/css/icons/remove_16.png',
						tooltip : 'Remover Rol.',
						handler : function(grid, rowIndex, colIndex) {
							var store=Ext.getCmp(me.id+'_grid').store;
							var record=store.getAt(rowIndex);
							Ext.MessageBox.confirm('Cofirmar',
									'&#191;Seguro de remover la opcion '+record.data.vOpcionNombre+'?', function(btn) {
										if (btn == 'yes') {
											
											if(record.data.iOpcionId){
											
											Ext.getCmp(me.id+'_grid').body.mask('Removiendo la Opcion.');
							        		 new Util.Ajax.runAjax({
							          				url : 'deleteopcion.app',
							          				method : 'POST',
							          				async : true,
							          				params : {idOpcion:record.data.iOpcionId}
							          				,success:function(result){
							          					var response=Ext.decode(result.responseText);
							          					Ext.getCmp(me.id+'_grid').body.unmask();
							          					if(response.success){
							          						var msg=response.message;
							          						Util.UiMessageBox({msg:msg,title:'Mensaje'});
							          						store.removeAt(rowIndex);
							          					}else{
							          						Util.UiMessageBox({msg:response.message,title:'Error',iconClsAceptar:'cancel_24'});
							          					}
							          				}
							          			});
											}else{
												store.removeAt(rowIndex);
											}
										}
									});
						}
					}],
					width : 55
			        }
					 ]	
            ,
            dockedItems : [{
				xtype : 'toolbar',
				dock : 'top',
				items : [
						{
							text : 'Agregar Opci&oacute;n',
							iconCls : 'create_16',
							id:me.id+'_grid_action_new',
							handler : function() {
								var store=Ext.getCmp(me.id+'_grid').store;
		                    	var c=0;
								store.each(function(){
										c++;
								});
		                    	store.insert(c,{iRolId:'',vRolNombre:''});
		                    }
						}
						,'->'
						,{
							xtype : 'ComboCustomized',
							parametros : {
								url : 'findallopciones.app',
								addRecordsExtra:[{
									iOpcionId:''
									,vOpcionNombre:'Todas las Opciones'
								},{
									iOpcionId:'0'
										,vOpcionNombre:DES_ROOT_MENU
									}],
								params : {
								},
								record : {
									fields : [
											{name : "iOpcionId"},
											{name : "vOpcionNombre"}
									]
								}
							},
							displayField : 'vOpcionNombre',
							forceSelection : true,
							width:240,
							valueField : 'iOpcionId',
							enableKeyEvents : true,
							emptyText : 'Filtrar por padre de la opcion',
							queryMode : 'local',
							name : 'desPadre',
							listeners : {
								select : function(field,record,c) {
									
									
									Ext.getCmp(me.id+'_grid').store.load({params:{iOpcionIndpadre:field.getValue()}});
									
								}
							},
							listConfig : {
								getInnerTpl : function() {
									return '<div style="padding:2px;">{vOpcionNombre}</div>';
								}
							}
		                
						}
												
					]
			}]
            ,listeners:{
            	select:function(thisGrid, record, index, eOpts){
//            		Ext.getCmp(me.id+'_grid_action_edit').setDisabled(false);
//            		Ext.getCmp(me.id+'_grid_action_key').setDisabled(false);
//            		if(record.data.iUsuarioIndhabilitado==ESTADO_ACTIVO){
//            			Ext.getCmp(me.id+'_grid_action_disabled').setDisabled(false);
//            			Ext.getCmp(me.id+'_grid_action_enable').setDisabled(true);
//            		}else{
//            			Ext.getCmp(me.id+'_grid_action_enable').setDisabled(false);
//            			Ext.getCmp(me.id+'_grid_action_disabled').setDisabled(true);
//            		}
            	},
            	deselect:function( thisGrid, record, index, eOpts ){
//            		Ext.getCmp(me.id+'_grid_action_edit').setDisabled(true);
//            		Ext.getCmp(me.id+'_grid_action_key').setDisabled(true);
//            		Ext.getCmp(me.id+'_grid_action_disabled').setDisabled(true);
//            		Ext.getCmp(me.id+'_grid_action_enable').setDisabled(true);
            	}
            
            }
            
    			
    	};
		this.callParent(arguments);
	}
});