
Ext.define('seguridad.AdministracionUsuarios', {
	extend : 'Ext.panel.Panel',
	alias : 'widget.userAdmin',
	getListRoles:function(){
		var me=this;
		var grid=Ext.getCmp(me.id+'_gridAdminUser');
		var store=grid.store;
		var roles=null;
		var i=0;
		store.each(function(){
			if(!roles){roles= new Object();}
			roles['roles['+i+'].iUsuarioxrolRolId']=this.data.iRolId;
			i++;
		});
		return roles;
	},
	saveUser:function(options){
		var me=this;
		
		if(Ext.getCmp(me.id+'_formAdminUser').getForm().isValid()){
			var formValues=Util.serialize(me.id+'_formAdminUser');
			var roles=me.getListRoles();
			if(!roles){
				Ext.Msg.alert('Mensaje','Se debe asignar al menos un rol al usuario.');
				return;
			}
			Ext.apply(formValues,roles);
			console.log(formValues);
			Ext.getCmp(options.idWin).body.mask('Espere un momento por favor.');
			new Util.Ajax.runAjax({
				url : 'saveusuario.app',
				method : 'POST',
				async : true,
				params : formValues
				,success:function(result){
					var response=Ext.decode(result.responseText);
					Ext.getCmp(options.idWin).body.unmask();
					if(response.success){
						var msg=response.message+'<br />La contrase&ntilde;a del usuario se env&iacute;o a la direccion electr&oacute;nica : <strong>'+formValues.vUsuarioEmail+'</strong>';
						Util.UiMessageBox({msg:(formValues.iUsuarioId?response.message:msg),title:'Mensaje'});
						console.log('options.idGrid->'+options.idGrid);
						if(Ext.getCmp(options.idGrid)){
							Ext.getCmp(options.idGrid).getSelectionModel().deselectAll();
							Ext.getCmp(options.idGrid).store.load();
						}
						if(Ext.getCmp(options.idWin)){
							Ext.getCmp(options.idWin).close();
						}
					}else{
						Util.UiMessageBox({msg:response.message,title:'Error',iconClsAceptar:'cancel_24'});
					}
				}
			});
			
		}else{
			console.log('no es valido');
		}
		
	},
	createFormUser:function(){
		var me=this;
		var usuario;
		if(me.usuario){
			usuario=me.usuario
		}		
		Ext.create('Ext.form.Panel',{
					title:'Datos del Usuario',
					renderTo:me.id+'_form_admin_user'
					,border:false
					,layout:'form'
					,id:me.id+'_formAdminUser'
//					,width:385
					,fieldDefaults: {
						 labelWidth: 120
//			         	,fieldStyle:'background:#fff;'
//			        	,labelStyle:'color:#666;'
			        }
					,items:[
							{
							    xtype: 'hiddenfield',
							    name: 'iUsuarioId',
							    value: (usuario?usuario.iUsuarioId:'')
							}
							,
					        {
					        	xtype:'textfield'
					        	,fieldLabel: 'Login de Usuario'
					        	,allowBlank:false	
					        	,name:'vUsuarioUsername'
					        	,value: (usuario?usuario.vUsuarioUsername:'')
					        }
					        ,
					        {
					        	xtype:'textfield'
					        	,fieldLabel: 'Apellido Paterno'
					        	,allowBlank:false 
					        	,name:'vUsuarioApPaterno'
					        	,value: (usuario?usuario.vUsuarioApPaterno:'')
					        }
					        ,
					        {
					        	xtype:'textfield'
					        	,fieldLabel: 'Apellido Materno'
					        	,name:'vUsuarioApMaterno'
					        	,value: (usuario?usuario.vUsuarioApMaterno:'')
					        }
					        ,
					        {
					        	xtype:'textfield'
					        	,fieldLabel: 'Nombres'
					        	,allowBlank:false	
					        	,name:'vUsuarioNombres'
					        	,value: (usuario?usuario.vUsuarioNombres:'')
					        }
					        ,
					        {
					        	xtype:'textfield'
					        	,fieldLabel: 'Correo Electronico'
					        	,vtype:'email'
					        	,allowBlank:false	
					        	,name:'vUsuarioEmail'
					        	,value: (usuario?usuario.vUsuarioEmail:'')
					        }
					        ,
					        {
					        	xtype:'datefield'
					        	,fieldLabel: 'Fec. Nacimiento'
					        	,name:'dUsuarioFecnacimiento'
					        	,value: (usuario?new Date(usuario.dUsuarioFecnacimiento):'')
					        }
					        ,
					        {
								xtype : 'ComboCustomized',
								fieldLabel: 'Seleccion el Sexo',
								allowBlank:false,
								parametros : {
									url : 'listelementocatalogobyidgrupo.app',
									callback:function(){
										if(usuario){
											Ext.getCmp(me.id+'_iUsuarioSexo').setValue(usuario.iUsuarioSexo);
										}
									},
									params : {
											idGrupo:3
									},
									record : {
										fields : [

												{
													name : "iCatalogoId"
												},
												{
													name : "vCatalogoNombre"
												},
												{
													name : "vCatalogoAbreviatura"
												},
												{
													name : "vCatalogoDefinicion"
												},
												{
													name : "iCatalogoGrupoId"
												}

										]
									}
								},
								displayField : 'vCatalogoNombre',
								forceSelection : true,
								valueField : 'iCatalogoId',
								enableKeyEvents : true,
								allowBlank : false,
								blankText : 'Seleccione el Sexo del usuario',
								queryMode : 'local',
								name:'iUsuarioSexo',
								id:me.id+'_iUsuarioSexo',
								listeners : {
									select : function(field,
											record, c) {

									}
								},
								listConfig : {

									getInnerTpl : function() {
										return '<div style="padding:2px;">{vCatalogoNombre}</div>';
									}
								}
							}
					        ]
			
		});
		
	
	},
	createGridRoles:function(){
		var me=this;
		var roles;
		var data=new Array();
		if(me.usuario && me.usuario.roles){
			roles=me.usuario.roles;
		}		
		if(roles){
			Ext.each(roles,function(usuarioRol){
				data.push(usuarioRol.rol);
			});
		}		
		var store=Ext.create('Ext.data.Store', {
		    fields:[
		            {name:'iRolId'}, 
		            {name:'vRolNombre'}
		            ],
		    data:{'items':data},
		    proxy: {
		        type: 'memory',
		        reader: {
		            type: 'json',
		            root: 'items'
		        }
		    }
		});

		var grid=Ext.create('Ext.grid.Panel', {
			border:false,
			id:me.id+'_gridAdminUser',
			dockedItems: [{
                xtype: 'toolbar',
                items: [{
                    iconCls: 'create_16',
                    text: 'Agregar',
                    handler: function(){
                    	var c=0;
						store.each(function(){
								c++;
						});
                    	store.insert(c,{iRolId:'',vRolNombre:''});
                    }
                	}]
			}],
			plugins: [Ext.create('Ext.grid.plugin.CellEditing', {
		         clicksToEdit: 1,
		         listeners:{
		        	 edit:function(editor, e, eOpts){
		        		 e.record.commit();
		        	 }
		         }
		     })],
		    store:store ,
		    columns: [
		        { text: 'ID. Rol',  dataIndex: 'iRolId',width:60 },
		        { text: 'Rol', dataIndex: 'vRolNombre', flex: 1,
	                field: {
						xtype : 'ComboCustomized',
						parametros : {
							url : 'findallrol.app',
							params : {
							},
							record : {
								fields : [
										{name : "iRolId"},
										{name : "vRolNombre"}
								]
							}
						},
						displayField : 'vRolNombre',
						forceSelection : true,
						valueField : 'vRolNombre',
						enableKeyEvents : true,
						allowBlank : false,
						blankText : 'Seleccione un Rol',
						queryMode : 'local',
						name : 'desRol',
						listeners : {
							select : function(field,record,c) {
								var row=grid.getSelectionModel().getSelection()[0];
								var store=grid.store;
								var idRol=record[0].data.iRolId;
								var c=0;
								store.each(function(){
									if(this.data.iRolId==idRol){
										c++;
									}
								});
								if(c==0){
									row.set('iRolId',record[0].data.iRolId);
								}else{
									store.remove(row);
									Ext.Msg.alert('Mensaje','El rol '+field.getValue()+' ya se encuentra agregado en la lista.');
								}
							}
						},
						listConfig : {
							getInnerTpl : function() {
								return '<div style="padding:2px;">{vRolNombre}</div>';
							}
						}
	                } }
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
						var record=store.getAt(rowIndex);
						Ext.MessageBox.confirm('Cofirmar',
								'&#191;Seguro de remover el rol '+record.data.vRolNombre+'?', function(btn) {
									if (btn == 'yes') {
										store.removeAt(rowIndex);
									}
								});
					}
				}],
				width : 55
		        }
		    ],
		    height: 220,
//		    width: 339,
		    renderTo: me.id+'_form_admin_user_roles'
		});
	},
	initComponent : function() {
		
		var me=this;
		
    	this.border=false;	
    	this.layout='column';
    	this.items=[
					{
					    columnWidth: 1,
					    padding: '5 5 0 5',
					    border:false,	
					    items:[{
					    	border:false,
//					    	bodyStyle:'background:#f5f5f5;',
					    	height: 290,
					        html: '<div class="panel">'+						            
									  '<div class="panel-body" style="padding:0px;" id="'+me.id+'_form_admin_user" ></div>'+
								'</div>'
							,listeners:{
									afterrender:function(thisPanel){
										me.createFormUser();										
									}
							}
								    }]
					},{
					    columnWidth: 1,
					    padding: '5 5 0 5',
					    border:false,	
					    items:[{
					    	border:false,
					    	bodyStyle:'background:#f5f5f5;',
					    	height: 290,
					        html: '<div class="panel">'+						            
									  '<div class="panel-body" style="padding:0px;" id="'+me.id+'_form_admin_user_roles" >'+
									 '</div>'+
								'</div>'
							,listeners:{
								afterrender:function(){
									me.createGridRoles();
								}
							}		 
					    }]
					}
    	       ];
		this.callParent(arguments);
	}
});