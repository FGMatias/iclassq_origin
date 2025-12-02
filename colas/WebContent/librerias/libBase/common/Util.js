var Util=new Object();
Util={
    getFecha:function (fec) {
	var fecha;
	if (fec) {
		fecha = new Date(fec);
	
	} else {

		fecha = new Date();
	}

	var mes = fecha.getMonth() + 1;
	if (mes <= 9) {
		mes = '0' + mes;
	}
	var year = fecha.getFullYear();
	var dia = fecha.getDate();
	if (year < 1930) {
		dia++;
	}
	if (dia <= 9) {
		dia = '0' + dia;
	}

	var factual = dia + '/' + mes + '/' + year;
	return factual;
},

getHora: function(){
	var fecha = new Date();	
	var horaTemp = fecha.getHours();
	var hora='';
	if(horaTemp.length == 1){
		hora = '0'+horaTemp;
	}else{
		hora = horaTemp;
	}
	var minutoTemp= fecha.getMinutes();
	var minutos = '';
	if(minutoTemp.length == 1){
		minutos='0'+minutoTemp;
	}else{
		minutos = minutoTemp;
	}
	var segundosTemp= fecha.getSeconds();
	var segundos='';
	if(segundosTemp.length == 1){
		segundos = '0'+segundosTemp;
	}else{
		segundos = segundosTemp;
	}
	return hora+':'+minutos+':'+segundos;	
},



    serialize : function(idPanel, options) {

        var me=this;
        var panel = Ext.getCmp(idPanel);

        var result = new Object();

        var items = this.getAllItemsFromPanel(panel);

        Ext.each(items, function(item) {

            if(item.xtype=='hiddenfield' && item.name){
                                            
                result[item.name] = item.getValue();
                                            
            }else{

                if (item.isVisible() && item.name) {

                    if (item.getValue) {

                        if (item.xtype == 'checkboxfield'
                            || item.xtype == 'datefield'
                            || item.xtype == 'textfield'
                            || item.xtype == 'ComboCustomized'
                            || item.xtype == 'timefield'
                            || item.xtype == 'radiofield'
                            || item.xtype == 'checkboxgroup'
                            || item.xtype == 'numberfield'
                            || item.xtype == 'ComboPaginado'
                            || item.xtype == 'hiddenfield'
                            || item.xtype == 'combobox'
                            || item.xtype == 'combo'
                            || item.xtype == 'textarea'
                            || item.xtype == 'htmleditor') {

                            if (item.xtype == 'checkboxfield'
                                || item.xtype == 'radiofield') {
                                if (item.checked) {

                                    result[item.name] = item.inputValue;
                                }
                            } else {

                                if (item.xtype == 'datefield') {

                                    if (item.getValue()) {
                                        result[item.name] = me.getFecha(item.getValue());
                                        result[item.name + '_text'] = item.getRawValue();
                                    } else {
                                        result[item.name + '_text'] = '';
                                    }

                                } else {

                                    if (item.xtype == 'ComboPaginado'
                                        || item.xtype == 'ComboCustomized'
                                        || item.xtype == 'combo'
                                        || item.xtype == 'combobox') {
                                        if (item.name&& item.name.indexOf('numDireclug') >= 0) {
                                            if (!result[item.name]
                                                || result[item.name] == null)
                                                result[item.name] = item         .getRawValue();
                                        } else if (item.name) {
                                            result[item.name] = item.getValue();
                                           // result[item.name + '[text]'] = item.getRawValue();
                                        }

                                    } else {

                                        if (item.xtype == 'timefield') {

                                            result[item.name] = item.getRawValue();

                                        } else {
                                            if (!result[item.name]
                                                || result[item.name] == null
                                                || result[item.name] == '')
                                                result[item.name] = item.getValue();
                                      

                                        }
                                    }

                                }

                            }
                        }

                    }
                }

            }
        });

        return result;

    },
    getAllItemsFromPanel:function(panel){
        var me=this;
        var children = panel.items ? panel.items.items : [];
        Ext.each(children, function(child) {
            children = children.concat(me.getAllItemsFromPanel(child));
        })
        return children;
    },
    
    
    
    
    Ajax:{
        runAjax : function(config) {
            
			var ret;
			if (config.showMessageBox) {
				Ext.MessageBox.wait('Espere un momento porfavor...');
			}
			Ext.Ajax.request({
						url : config.url,
						async : config.async,
						timeout:config.timeout || 50000000,
                                                method : config.method,
						headers : config.headers || {
							Accept : 'application/json, text/javascript, */*; q=0.01'
						},
						callback : config.callback
								|| function(options, success, response) {
									if (config.showMessageBox) {
										Ext.MessageBox.updateProgress(1);
										Ext.MessageBox.hide();
									}
									ret = Ext.decode(response.responseText);
								},
						listeners : {
							beforerequest : config.beforerequest
						},
						success : config.success || function(response) {
							ret = Ext.decode(response.responseText);
						},
						failure : config.failure || function(response) {
							alert('Error Inesperado');
						},
						params : config.params 
					});
			return ret;
                    
                }
                ,
                genericAjaxExt4 : function(config) {

			var ret;
			if (config.msg) {
				Ext.MessageBox.wait('Espere un momento porfavor...');
			}
			Ext.Ajax.request({
						url : config.url,
						async : config.async,
						headers : {
							Accept : 'application/json, text/javascript, */*; q=0.01'
						},
						method : config.method,
						callback : config.callback
								|| function(options, success, response) {
									if (config.msg) {
										Ext.MessageBox.updateProgress(1);
										Ext.MessageBox.hide();
									}
									ret = Ext.decode(response.responseText);
								},
						listeners : {
							beforerequest : config.beforerequest
						},
						success : config.success || function(response) {
							ret = Ext.decode(response.responseText);

							if (ret.success
									&& (ret.message != '' && ret.message != null)) {

								if (config.showAlert) {
									alert(ret.message);
								}
							} else if (!ret.success) {

								if (ret.message) {
									if (config.showAlert) {
										alert(ret.message);
									}
								}
							}
						},
						failure : config.failure || function(response) {
					
						},
						params : config.params,
						jsonData : config.jsonParam
					});
			return ret;

		}
        
    }
    ,
    UiMessageBox:function(config){
    	
    	if(config.msg){
    	
		    	var idWin=Ext.id();
		    	
		    	Ext.create('Ext.window.Window', {
		    	    title: config.title || 'Mensaje',
		    	    modal:true,
		    	    id:idWin,
		    	    layout: 'fit',
		    	    bodyStyle:config.bodyStyle || 'padding:20px;background:#fff;',
		    	    items: { 
		    	        xtype: 'component',
		    	        border: false,
		    	        html:'<div class="contentMensajeGeneric">'+config.msg+'</div>'
		    	    },
		    	    buttons:[
		    	             {
		    	            	 text:config.textAceptar || 'Aceptar'
		    	            	 ,scale:'medium'
		    	            	 ,hidden:config.hideSuccess
		    	            	 ,iconCls:config.iconClsAceptar || 'ok_24'
		    	            	 ,handler:function(){
		    	            		
		    	            		 if(config.fn_aceptar){		    	            			 
		    	            			 config.fn_aceptar();
		    	            		 }
		    	            		 Ext.getCmp(idWin).close();
		    	            	 }
		    	             }
		    	             ,
		    	             {
		    	            	 text:config.textCancelar || 'Cancelar'
		    	            	 ,scale:'medium'
		    	            	 ,hidden:!config.showCancel
		    	            	 ,iconCls:config.iconClsCancelar || 'cancel_24'
		    	            	 ,handler:function(){
		        	            		 if(config.fn_concelar){
		        	            			 config.fn_concelar();
		        	            		 }
		        	            		 Ext.getCmp(idWin).close();
		        	            	 }
		    	             }
		    	             ]
		    	}).show();
    }
    	
    }
    
}

Ext.apply(Ext.form.field.VTypes, {
    daterange: function(val, field) {
        var date = field.parseDate(val);

        if (!date) {
            return false;
        }
        if (field.startDateField && (!this.dateRangeMax || (date.getTime() != this.dateRangeMax.getTime()))) {
            var start = field.up('form').down('#' + field.startDateField);
            start.setMaxValue(date);
            start.validate();
            this.dateRangeMax = date;
        }
        else if (field.endDateField && (!this.dateRangeMin || (date.getTime() != this.dateRangeMin.getTime()))) {
            var end = field.up('form').down('#' + field.endDateField);
            end.setMinValue(date);
            end.validate();
            this.dateRangeMin = date;
        }
        /*
         * Always return true since we're only using this vtype to set the
         * min/max allowed values (these are tested for after the vtype test)
         */
        return true;
    },

    daterangeText: 'La fecha de inicio debe ser menor que la fecha de finalizaci&oacute;n',

    password: function(val, field) {
        if (field.initialPassField) {
            var pwd = field.up('form').down('#' + field.initialPassField);
            return (val == pwd.getValue());
        }
        return true;
    },

    passwordText: 'Las contrase&ntilde;as no coinciden.'
});

