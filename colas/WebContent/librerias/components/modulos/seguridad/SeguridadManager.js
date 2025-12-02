Ext.ns('SeguridadManager');
SeguridadManager={
		
	openAdminUser:function(option){
		var usuario=option.usuario;
		console.log(usuario);
		var config={

                title: option.title || 'Crear Nuevo Usuario',
                width: 800,
                id:'winUsuariosEditSave',
                modal:true,
                height: 650,
                resizable:false,
                layout: 'fit',
                defaultType: 'container',
                bodyStyle:'padding:4px;',
                items:[
                       {
                       	xtype:'userAdmin'
                       	,id:'userAdmin'	
//                       	,bodyStyle:'background:#f5f5f5;'
                       	,usuario:usuario
                       }
                       ],
		buttons:[
		          {
		        	  text:'Grabar'
		              ,scale:'medium'
		              ,iconCls:'grabar_24'
		              ,handler:function(){
		            	  Ext.getCmp('userAdmin').saveUser({idWin:'winUsuariosEditSave',idGrid:option.idGrid});
		              }
		          }
		          ]
			
		};
		
		Ext.create('Ext.window.Window', config).show();
		
	},
	openCambiarPassword:function(option){
		var usuario=option.usuario;
		
		var config={

                title:'Cambiar Contrase&ntilde;a',
                width: 400,
                id:'winCambiarClave',
                modal:true,
                resizable:false,
                layout: 'fit',
                defaultType: 'container',
                bodyStyle:'padding:10px;',
                items:[
                       {
                       	xtype:'form'
                       	,id:'formCambiarClave'	
                       	,border:false
//                       	,bodyStyle:'background:#fff;'
                       	,defaults: {
	                                width: 360,
	                                inputType: 'password'
//	                                ,fieldStyle:'background:#fff;'
	                                ,labelWidth:125
	                                ,labelStyle:'color:#666;'
                            },
                            defaultType: 'textfield',
                            items:[
								{
								    fieldLabel: 'Contrase&ntilde;a Actual',
								    hidden:(usuario?true:false),
								    disabled:(usuario?true:false),
								    allowBlank: false,
								    name: 'passwordActual'
								},
                                   {
                                fieldLabel: 'Nueva Contrase&ntilde;a',
                                name: 'vUsuarioPassword',
                                itemId: 'pass',
                                allowBlank: false,
                                listeners: {
                                    validitychange: function(field){
                                        field.next().validate();
                                    },
                                    blur: function(field){
                                        field.next().validate();
                                    }
                                }
                            }, {
                                fieldLabel: 'Confirmar Contrase&ntilde;a',
                                name: 'pass-cfrm',
                                allowBlank: false,
                                vtype: 'password',
                                initialPassField: 'pass' // id of the initial password field
                            }]
                       		
                       }
                       ]
		,buttons:[
		          {
		        	  text:'Modificar'
		              ,scale:'medium'
		              ,iconCls:'key_24'
		              ,handler:function(){
		            	  console.log(usuario)
		            	  var idUsuario;
		            	  if(option.tipo==MODE_CHANGE_PASS_PERFIL){
		            		  idUsuario=USER_ID_JSP;
		            	  }else{
		            		  if(usuario){
		            			  idUsuario= usuario.iUsuarioId;
		            		  }
		            	  }
		            	  console.log(idUsuario)
		            	  if(idUsuario){
		            		  if(Ext.getCmp('formCambiarClave').getForm().isValid()){
		            		  var params={
		            				  iUsuarioId:idUsuario
		            				  ,modeChangePassword:option.tipo
		            		  };
		            		  Ext.apply(params,Util.serialize('formCambiarClave'));
		            		  console.log(params);
		            		  Ext.getCmp('winCambiarClave').body.mask('Espere un momento por favor');
		            		  new Util.Ajax.runAjax({
		          				url : 'cambiarclaveuser.app',
		          				method : 'POST',
		          				async : true,
		          				params : params
		          				,success:function(result){
		          					var response=Ext.decode(result.responseText);
		          					Ext.getCmp('winCambiarClave').body.unmask();
		          					if(response.success){
		          						var msg=response.message;
		          						Util.UiMessageBox({msg:msg,title:'Mensaje'});
		          						Ext.getCmp('winCambiarClave').close();
		          					}else{
		          						Util.UiMessageBox({msg:response.message,title:'Error',iconClsAceptar:'cancel_24'});
		          					}
		          				}
		          			});
		            		  
		            		  }
		            	  }
		            	  
		              }
		          }
		          ]
			
		};
		
		Ext.create('Ext.window.Window', config).show();
		
	}	
	,
	deshabilitarUsuario:function(options){
		
		var usuario=options.usuario;
		var grid=options.grid;
		Util.UiMessageBox({
			msg : options.msgConfirm,
			title : 'Confirmar',
			textAceptar : 'Si',
			fn_aceptar:function(){
				console.log('1');
				new Util.Ajax.runAjax({
      				url : 'cambiarestadouser.app',
      				method : 'POST',
      				async : true,
      				params : {
      					
      					iUsuarioId:usuario.iUsuarioId
      					,iUsuarioIndhabilitado:options.enable
      					
      				}
      				,success:function(result){
      					var response=Ext.decode(result.responseText);
      					var msg=response.message;
      					if(response.success){
      						
      						options.grid.store.load();
      						
      						if(options.enable==ESTADO_ACTIVO){
      	            			Ext.getCmp(options.grid.id+'_action_disabled').setDisabled(false);
      	            			Ext.getCmp(options.grid.id+'_action_enable').setDisabled(true);
      	            		}else{
      	            			Ext.getCmp(options.grid.id+'_action_enable').setDisabled(false);
      	            			Ext.getCmp(options.grid.id+'_action_disabled').setDisabled(true);
      	            		}
      						
      					}
      					
      					Util.UiMessageBox({msg:msg,title:'Mensaje'});
      				}
      			});
				
			},
			textCancelar:'No',
			showCancel:true
		});
	}
	,
	personalizarTema:function(){
		
		Ext.create('Ext.window.Window', {
		    title: 'Personalizar Tema',
		    height: 350,
		    width: 600,
		    modal:true,
		    id:'winPersonalizarTema',
		    layout: 'form',
		    autoScroll:true,
		    bodyStyle:'padding:10px 0px 10px 10px;',
		    items:[
		           {
		        	   xtype:'component'
		        	  ,html:'<div style="width:565px;float:left;">'+
		        	  		'<div style="float:left;border:1px #ccc solid;width:180px;height:130px;margin:0px 10px 0px 0px;"><img lang="Tema por Defecto" class="imgTema" src="librerias/imagenes/background2.jpg" /></div>'+
		        	  		'<div style="float:left;border:1px #ccc solid;width:180px;height:130px;margin:0px 10px 0px 0px;"><img lang="Tema Aqua" class="imgTema" src="librerias/imagenes/tiger_light_blue.jpg" /></div>'+
		        	  		'<div style="float:left;border:1px #ccc solid;width:180px;height:130px;margin:0px 0px 0px 0px;"><img lang="Tema red" class="imgTema" src="librerias/imagenes/bgrojo.png" /></div>'+
		        	  		''+
		        	  		''+
		        		  '</div>'
		        	  	,listeners:{
		        	  		afterrender:function(){
		        	  			$('.imgTema').each(function(){
		        	  				var test=this.lang;
		        	  				$(this).qtip({ 
	                                    content: {
	                                        text:test 
	                                        },
	                                    style: {
	                                        classes: 'qtip-dark qtip-shadow'
	                                    },
	                                    position: {
	                                        my: 'top center',  // Position my top left...
	                                        at: 'bottom center'
	                                    }
	                                });
		        	  				
		        	  			});
		        	  			
		        	  			$('.imgTema').click(function(){
		        	  				var imgBg=$(this).attr('src');
		        	  				
		        	  				Util.UiMessageBox({
		        	  					msg : 'Seguro de Personalizar el Tema del Sistema?',
		        	  					title : 'Confirmar',
		        	  					textAceptar : 'Si',
		        	  					fn_aceptar:function(){
		        	  						new Util.Ajax.runAjax({
		        	  		      				url : 'personalizartema.app',
		        	  		      				method : 'POST',
		        	  		      				async : true,
		        	  		      				params : {
		        	  		      					bgApp:imgBg
		        	  		      				}
		        	  		      				,success:function(result){
		        	  		      					var response=Ext.decode(result.responseText);
		        	  		      					var msg=response.message;
		        	  		      					Util.UiMessageBox({msg:msg,title:'Mensaje'});
		        	  		      					$('#SIREPAPP_panelCenter-body').css('background','url('+imgBg+')');
		        	  		      					Ext.getCmp('winPersonalizarTema').close();
		        	  		      				}
		        	  		      			});
		        	  						
		        	  					},
		        	  					textCancelar:'No',
		        	  					showCancel:true
		        	  				});
		        	  				
		        	  				
		        	  				
		        	  			});
		        	  		}
		        	  	}	
		           }
		           ]
		}).show();
		
	}
		
};