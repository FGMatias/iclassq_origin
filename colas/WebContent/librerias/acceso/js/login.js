Ext.ns('login');
login={
		
		init:function(){
			try{
			 $('#roles').selectize({create: false});
			 
			 $('.inputLogin').bind('keypress', function(e) {
				    var code = (e.keyCode ? e.keyCode : e.which);
				     if(code == 13) { 
				    	 login.validateLogin();
				     }
				});
			 
			 $('.selectize-input').click(function(){
				 
				 if($('#j_username').val().length>0){
				 var c=0;
					$('#roles').find('option').each(function(){
						
						if(!Ext.isEmpty(this.value)){
							c++;
						}
					});
					
					if(c==0){
						login.findRolesByUserName($('#j_username').val());
						return;
					}
				 }
				 
			 });
			}catch (e) {
				// TODO: handle exception
				alert('error')
			}
			 
		},
		
		validateLogin:function(){
			debugger
			var j_username = $('#j_username').val();
			var j_password = $('#j_password').val();
			var j_rol = $('#roles').val();
			var c=0;
			$('#roles').find('option').each(function(){
				
				if(!Ext.isEmpty(this.value)){
					c++;
				}
			});
			
			if(c==0){
				login.findRolesByUserName($('#j_username').val());
				return;
			}
			
			if(!j_username){
				$('#messageValidation').html('Debe ingresar el usuario.');
				return;
			}
			
			if(!j_password){
				$('#messageValidation').html('Debe ingresar la contrase&ntilde;a.');
				return;
			}
			
			if(!j_rol){
				$('#messageValidation').html('Seleccione un Rol.');
				return;
			}
			$('#messageValidation').empty();
			document.getElementById('j_form_login').submit();
			
		},
		findRolesByUserName:function(username){
			
			if($('#j_username').val().length>0){
				$('#j_password').val('');
				var myMask = new Ext.LoadMask(Ext.get('loginPanel'), {msg:"Obteniendo roles para el usuario <b>"+$('#j_username').val()+"</b>"});
				myMask.show();
				setTimeout(function(){

					$.ajax({
						  type: "POST",
						  async:true,
						  url: 'obtenerrolesbyusername.app',
						  data: {username:username}
//						  ,error:function(){
//							  myMask.hide();
//							  Util.UiMessageBox({
//									msg : 'Ocurri&oacute; un error al intentar obtener los roles del usuario ingresado.<br/> Desea volver ha intentar obtener los roles del usuario?',
//									title : 'Error',
//									textAceptar : 'Si',
//									fn_aceptar:function(){
//										login.findRolesByUserName($('#j_username').val());
//									},
//									textCancelar:'No',
//									fn_concelar:function(){
//										myMask.hide();
//									},
//									showCancel:true
//								});
//						  }
//						  ,success: function(response, textStatus, jqXHR){
//							  myMask.hide();
//							  var data=response.data;
						,error:function(xhr){
                              myMask.hide();
                              var msg = xhr && xhr.responseJSON && xhr.responseJSON.message;
                              if(msg){
                                      $('.errorlogin').html(msg);
                                      $('#messageValidation').html(msg);
                              }
                              Util.UiMessageBox({
                                            msg : 'Ocurri&oacute; un error al intentar obtener los roles del usuario ingresado.<br/> Desea volver ha intentar obtener los roles del usuario?',
                                            title : 'Error',
                                            textAceptar : 'Si',
                                            fn_aceptar:function(){
                                                    login.findRolesByUserName($('#j_username').val());
                                            },
                                            textCancelar:'No',
                                            fn_concelar:function(){
                                                    myMask.hide();
                                            },
                                            showCancel:true
                                    });
                      }
                      ,success: function(response, textStatus, jqXHR){
                              myMask.hide();
                              $('#contentRoles').empty();
                              $('.errorlogin').empty();
                              $('#messageValidation').empty();
                              if(response && response.success === false){
                                      $('.errorlogin').html(response.message);
                                      $('#messageValidation').html(response.message);
                                      return;
                              }
                              var data=response.data;
							  console.log(data);
							  if(data && data.length>0){
								  
								  $('#contentRoles').append(' <select name="rol" id="roles" placeholder="Selecione un Rol" style="width: 100%;" required></select>');
								  
								  $.each(data,function(key,value){
									  var rol=value.rol;
									  $('#roles').append('<option value="'+rol.iRolId+'">'+rol.vRolNombre+'</option>');
								  });
								  
								  login.init();
							  }else{
								  
								  $('#contentRoles').append('<div style="width:96% !important;padding:10px 5px 10px 5px;text-align:center;color:red;border:1px #ccc solid;background:#f5f5f5;">No se encontraron roles para el usuario ingresado.</div>');
								  
							  }
							  
						  },
						  dataType: 'json'
						});
					
				},600);
			
		}
		}
};

Ext.onReady(function(){
	 $('#j_username').val('');
	 $('#j_password').val('');
	 $('#cboSucursal').val(0);
     login.init();
	 
});