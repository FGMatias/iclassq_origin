Ext.Loader.setConfig({enabled: true});
Ext.Loader.setPath('Ext.ux', '/ext/lib/ext_4_2_1/ux');
Ext.require([
	             'Ext.grid.*',
	             'Ext.tree.*',
	             'Ext.window.Window',
	             'Ext.container.Viewport',
	             'Ext.layout.container.Border',
	             'Ext.state.*',
	             'Ext.data.*',
	             'Ext.grid.plugin.CellEditing',
	             'Ext.ux.grid.FiltersFeature',
	             'Ext.toolbar.Paging',
	             'Ext.ux.ajax.JsonSimlet',
	             'Ext.ux.ajax.SimManager'
	         ]);

var APP_ID_SIREP_JS = 'SIREPAPP';

Ext.onReady(function(){
	
	
	
	var myMask = new Ext.LoadMask(Ext.getBody(), {msg:"Cargando..."});
	myMask.show();
			//background:url('+BG_APP+');
	
           Ext.state.Manager.setProvider(Ext.create('Ext.state.CookieProvider'));
           Ext.create('Ext.container.Viewport', {
	                 layout: {
	                     type: 'border',
	                     padding: '0'
	                 },
	                 listeners:{
	                	 
	                	 afterrender:function(){
	                		 new Util.Ajax.runAjax({
			          				url : 'findusuariobypk.app',
			          				method : 'POST',
			          				async : true,
			          				params : {
			          					iUsuarioId:USER_ID_JSP
			          				}
			          				,success:function(result){
			          					var response=Ext.decode(result.responseText);
			          					myMask.hide();
			          					if(response.data){
			          						if(response.data.vUsuarioBgApplication){
			          							console.log('aaaaaa->>>>');
			          							console.log(response.data.vUsuarioBgApplication);
			          							$('#SIREPAPP_panelCenter-body').css('background','url('+response.data.vUsuarioBgApplication+')');
			          						}else{
			          							$('#SIREPAPP_panelCenter-body').css('background','url('+BG_APP_DEFAULT+')');
			          						}
			          					}else{
			          						$('#SIREPAPP_panelCenter-body').css('background','url('+BG_APP_DEFAULT+')');
			          					}
			          				}
			          			});
	                		 
	                	 }
	                	 
	                 },
	       items: [{
	                     region: 'north',
	                     height: 50,
	                     id:'panelNorte',
	                     resizable:false,
						 html:[
								'<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">'+
								        '<div style="padding:0px 10px 0px 10px;"><div class="navbar-collapse collapse">'+
								         ' <ul class="nav navbar-nav">'+
								         	MENU_USER_OPCIONES_JSP+									
								            ' <li class="dropdown" style="position:absolute;right:0px;margin:0px 10px 0px 0px;">'+
								            ' <a href="#" class="dropdown-toggle" data-toggle="dropdown">'+USER_JSP+' ('+ROL_NAME_JSP+') <b class="caret"></b></a>'+
								             '<ul class="dropdown-menu">'+
								              ' <li><a href="#" onclick="#">Editar los datos mi cuenta</a></li>'+
								              ' <li><a href="#" onclick="SeguridadManager.openCambiarPassword({tipo:MODE_CHANGE_PASS_PERFIL})">Cambiar Contrase&ntilde;a</a></li>'+
								              ' <li><a href="#" onclick="SeguridadManager.personalizarTema()">Personalizar Tema</a></li>'+
								              ' <li><a href="logout.app">Salir del Sistema</a></li>'+
								             '</ul>'+
								           '</li>'+
								         ' </ul>'+
								       ' </div>'+
								       ' </div>'+
								  '</div>'
									]
	                     
	                 },  {
	                     region: 'center',
	                     xtype: 'panel',	                     
	                     border:false,
		                 style:'border:0px;margin:0px;padding:0px;',
		                 id: APP_ID_SIREP_JS+ '_panelCenter',
		                 bodyStyle:'border:0px;',
		                 html:'<div id="'+APP_ID_SIREP_JS+'_main" style="height:100%;width:100%;margin:0px;padding:0px;"></div>'
		                	, dockedItems: [{
		                		    xtype: 'toolbar',
		                		    dock: 'bottom',
		                		    autoScroll:true,
		                		    id: APP_ID_SIREP_JS + '_buttomBar',
		                		    items:['->',{
		                		    	xtype:'component'
		                		    		,html:'<div style="padding:8px;"><strong>Copyright &copy; Todos los Derechos Reservados Essalud 2019</strong></div>'
		                		    	
		                		    }]
		                		}]
	                 }]
	             });
	         });

function openWindow(){
	
	Util.UiMessageBox({msg:'Este es un mensaje de prueba'})
	
}