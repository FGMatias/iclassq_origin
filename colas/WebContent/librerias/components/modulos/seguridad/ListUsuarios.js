Ext.define('seguridad.ListUsuarios', {
	extend : 'Ext.panel.Panel',
	alias : 'widget.listUsers',
	initComponent : function() {
		var filters = {
    	        ftype: 'filters',
    	        	 encode: true, // json encode the filter query
    	             local: true,
    	    };
		
		function rowStyle(v){
			return '<div style="padding:4px 0px 4px 0px;">'+(v?v:'')+'</div>';
			}
		
		var me=this;
    	this.border=false;	
    	;
    	this.items={

            	xtype:'sireGrid'
            	,width: 789
            	,features:[filters]
            	,border:false
            	,id:me.id+'_grid'
            	,bodyStyle:'padding:0px;'
            	,nameModel:'Usuario'
            	,fields:[{
    		        name: 'iUsuarioId',
    		        type: 'int'
    		    }, {
    		        name: 'vUsuarioUsername'
    		    }, {
    		        name: 'iUsuarioIndhabilitado'
    		    }, {
    		        name: 'vUsuarioEmail'
    		    }, {
    		        name: 'vUsuarioNombres'
    		    }, {
    		        name: 'dUsuarioFecnacimiento'
    		    }, {
    		        name: 'iUsuarioSexo'
    		    }, {
    		        name: 'vUsuarioApMaterno'
    		    }, {
    		        name: 'vUsuarioApPaterno'
    		    },{
    		    	name:'iUsuarioEstado'
    		    },{
    		    	name:'desEstado'
    		    	,mapping:'iUsuarioIndhabilitado'
    		    	,convert:function(v){
    		    		return (v==ESTADO_ACTIVO?'<img src="librerias/css/icons/aprobe_v1_16.png" title="Habilitado" />':'<img src="librerias/css/icons/no_aprobe_v1_16.png" title="Deshabilitado" />');
    		    	}
    		    }, 
    		    {
    		        name: 'nombreCompleto',
    		        mapping:'iUsuarioId',
    		        convert:function(v,r){
    		        	var nom=(r.data.vUsuarioApPaterno?r.data.vUsuarioApPaterno:'')+' '+(r.data.vUsuarioApMaterno?r.data.vUsuarioApMaterno:'')+' '+(r.data.vUsuarioNombres?r.data.vUsuarioNombres:'');
    		        	return nom;
    		        }
    		    }, {
    		        name: 'roles'
    		    }, {
    		        name: 'desRoles',
    		        mapping:'roles',
    		        convert:function(v,r){
    		        	var listRoles=new Array();
    		        	
    		        	Ext.each(v,function(item){
    		        		listRoles.push(item.rol.vRolNombre);
    		        	});
    		        	
    		        	var desRoles=listRoles.join(", ");
    		        	
    		        	return desRoles;
    		        }
    		    }
    		    ]
            ,readerStore:{
                type: 'json',
                root: 'data',
                idProperty: 'iUsuarioId'
//                	,
//                totalProperty: 'total'
            }
            ,loadStore:true
            ,url:'findallusuarios.app'
            ,columns: [
					{
						text:'ID User',
					    dataIndex: 'iUsuarioId',
					    width: 50,
					    hidden:true,
					    align:'center',
					    renderer:rowStyle,
					    filterable: true,
			            filter: {type: 'numeric'}
					}
					,
					{
						text:'Usuario',
					    dataIndex: 'vUsuarioUsername',
					    width: 120,
					    renderer:rowStyle,
			            filter: {
			                type: 'string'
			            }
					}
					,
					{
						text:'Nombre Completo',
					    dataIndex: 'nombreCompleto',
					    flex:1,
					    width: 150,
					    renderer:rowStyle,
			            filter: {
			                type: 'string'
			            }
					}
					,
					{
						text:'Roles',
					    dataIndex: 'desRoles',
					    flex:1,
					    renderer:rowStyle,
			            filter: {
			                type: 'string'
			            }
					}
					,
					{
						text:'Habilitado',
					    dataIndex: 'desEstado',
					    width:70,
					    align:'center',
					    renderer:rowStyle
					}
                       ]	
            ,
            dockedItems : [{
				xtype : 'toolbar',
				dock : 'top',
				items : [
						{
							text : 'Nuevo',
							iconCls : 'new_user_16',
							id:me.id+'_grid_action_new',
							handler : function() {
								SeguridadManager.openAdminUser({idGrid:me.id+'_grid'});
							}
						},
						'-',						
						{
							text : 'Editar',
							iconCls : 'edit_user_16',
							id:me.id+'_grid_action_edit',
							disabled:true,
							handler : function() {
								var grid = Ext.getCmp(me.id+'_grid');
								var record = grid.getSelectionModel().getSelection()[0];
								var usuario;
								
								if(record){
									usuario=record.data;
								}
								
								SeguridadManager.openAdminUser({
																	idGrid:me.id+'_grid'
																	,title:'Editar Usuario'
																	,usuario:usuario
																});
							}
						},'-',						
						{
							text : 'Cambiar Contrase&ntilde;a',
							iconCls : 'key_user_16',
							id:me.id+'_grid_action_key',
							disabled:true,
							handler : function() {
								var grid = Ext.getCmp(me.id+'_grid');
								var record = grid.getSelectionModel().getSelection()[0];
								var usuario;
								
								if(record){
									usuario=record.data;
								}
								
								SeguridadManager.openCambiarPassword({usuario:usuario,tipo:MODE_CHANGE_PASS_ADMIN});
							}
						},'-',
						{
							text : 'Deshabilitar',
							iconCls : 'delete_user_16',
							id:me.id+'_grid_action_disabled',
							disabled:true,
							handler : function() {
								var grid = Ext.getCmp(me.id+'_grid');
								var record = grid.getSelectionModel().getSelection()[0];
								var usuario;
								
								if(record){
									usuario=record.data;
								}
												SeguridadManager
														.deshabilitarUsuario({
															usuario : usuario,
															grid : grid,
															enable : ESTADO_INACTIVO,
															msgConfirm:'Seguro de deshabilitar al usuario seleccionado?'
														});
							}
						},'-',
						{
							text : 'Habilitar',
							iconCls : 'enable_user_16',
							id:me.id+'_grid_action_enable',
							disabled:true,
							handler : function() {
								var grid = Ext.getCmp(me.id+'_grid');
								var record = grid.getSelectionModel().getSelection()[0];
								var usuario;
								
								if(record){
									usuario=record.data;
								}
												SeguridadManager
														.deshabilitarUsuario({
															usuario : usuario,
															grid : grid,
															enable : ESTADO_ACTIVO,
															msgConfirm:'Seguro de habilitar al usuario seleccionado?'
														});
							}
						}
						
					]
			}]
            ,listeners:{
            	select:function(thisGrid, record, index, eOpts){
            		Ext.getCmp(me.id+'_grid_action_edit').setDisabled(false);
            		Ext.getCmp(me.id+'_grid_action_key').setDisabled(false);
            		if(record.data.iUsuarioIndhabilitado==ESTADO_ACTIVO){
            			Ext.getCmp(me.id+'_grid_action_disabled').setDisabled(false);
            			Ext.getCmp(me.id+'_grid_action_enable').setDisabled(true);
            		}else{
            			Ext.getCmp(me.id+'_grid_action_enable').setDisabled(false);
            			Ext.getCmp(me.id+'_grid_action_disabled').setDisabled(true);
            		}
            	},
            	deselect:function( thisGrid, record, index, eOpts ){
            		Ext.getCmp(me.id+'_grid_action_edit').setDisabled(true);
            		Ext.getCmp(me.id+'_grid_action_key').setDisabled(true);
            		Ext.getCmp(me.id+'_grid_action_disabled').setDisabled(true);
            		Ext.getCmp(me.id+'_grid_action_enable').setDisabled(true);
            	}
            
            }
            
    			
    	};
		this.callParent(arguments);
	}
});