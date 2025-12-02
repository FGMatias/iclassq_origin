Ext.define('seguridad.ListRoles', {
	extend : 'Ext.panel.Panel',
	alias : 'widget.listRoles',
	initComponent : function() {
		var filters = {
    	        ftype: 'filters',
    	        	 encode: true, // json encode the filter query
    	             local: true,
    	    };
		
		function rowStyle(v){
			return (v?v:'');
			}
		
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
    		        name: 'iRolId',
    		        type: 'int'
    		    }, {
    		        name: 'vRolNombre'
    		    }
    		    ]
    		,sorters:[{
                    property: 'iRolId',
                    direction: 'ASC'
                }]
            ,readerStore:{
                type: 'json',
                root: 'data',
                idProperty: 'iRolId'
//                	,
//                totalProperty: 'total'
            }
            ,loadStore:true
            ,url:'findallrol.app'
            ,plugins:[Ext.create('Ext.grid.plugin.CellEditing', {
		         clicksToEdit: 2,
		         listeners:{
		        	 edit:function(editor, e, eOpts){
		        		 
		        		 var rol=new Object();
		        		 rol.vRolNombre=e.record.data.vRolNombre;
		        		 if(e.record.data.iRolId){
		        			 rol.iRolId=e.record.data.iRolId;
		        		 }
		        		 
		        		 if(e.originalValue!=e.value){
		        		
			        		 Ext.getCmp(me.id+'_grid').body.mask('Procesando la Solicitud. Espere un momento por favor.');
			        		 new Util.Ajax.runAjax({
			          				url : 'saverol.app',
			          				method : 'POST',
			          				async : true,
			          				params : rol
			          				,success:function(result){
			          					var response=Ext.decode(result.responseText);
			          					Ext.getCmp(me.id+'_grid').body.unmask();
			          					if(response.success){
			          						var msg=response.message;
			          						Util.UiMessageBox({msg:msg,title:'Mensaje'});
			          						e.record.set('iRolId',response.data.iRolId);
			          						e.record.commit();
			          					}else{
			          						Util.UiMessageBox({msg:response.message,title:'Error',iconClsAceptar:'cancel_24'});
			          					}
			          				}
			          			});
		        		 
		        		 }
		        	 }
		         }
		     })	]
            ,columns: [
					{
						text:'ID Rol',
					    dataIndex: 'iRolId',
					    width: 60,
					    align:'center',
					    renderer:rowStyle,
					    filterable: true,
			            filter: {type: 'numeric'}
					}
					,
					{
						text:'Nombre Rol',
					    dataIndex: 'vRolNombre',
					    flex: 1,
					    renderer:rowStyle,
					    field:{
					    	xtype:'textfield',
					    	fieldStyle:'background:#fff;',
					    	allowBlank:false
					    },
			            filter: {
			                type: 'string'
			            }
					} ,{
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
									'&#191;Seguro de remover el rol '+record.data.vRolNombre+'?', function(btn) {
										if (btn == 'yes') {
											
											if(record.data.iRolId){
											
											Ext.getCmp(me.id+'_grid').body.mask('Removiendo el rol.');
							        		 new Util.Ajax.runAjax({
							          				url : 'deleterol.app',
							          				method : 'POST',
							          				async : true,
							          				params : {idRol:record.data.iRolId}
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
							text : 'Agregar Rol',
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