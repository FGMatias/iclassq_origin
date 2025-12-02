/**
 * @utor Angel Tomas url: solucion
 *       http://www.sencha.com/forum/showthread.php?152803-Picker-quot-Loading...-quot-mask-stuck-on
 *       es un parche para corregir el error del mask loading... deberia
 *       corregirse en versiones mayor a la 4.0.7 linea corregida
 * 
 * loadMask: me.queryMode === 'local' ? false: true
 * 
 */
Ext.override(Ext.form.field.ComboBox, {
			createPicker : function() {
				var me = this, picker, menuCls = Ext.baseCSSPrefix + 'menu';
				if(me.xtype!='timefield'){
				var opts = Ext
						.apply({
									pickerField : me,
									selModel : {
										mode : me.multiSelect
												? 'SIMPLE'
												: 'SINGLE'
									},
									floating : true,
									hidden : true,
									ownerCt : me.ownerCt,
									cls : me.el.up('.' + menuCls)
											? menuCls
											: '',
									store : me.store,
									displayField : me.displayField,
									focusOnToFront : false,
									pageSize : me.pageSize,
									tpl : me.tpl,
									loadMask : me.queryMode === 'local'
											? false
											: true
								}, me.listConfig, me.defaultListConfig);

				picker = me.picker = Ext.create('Ext.view.BoundList', opts);
				if (me.pageSize) {
					picker.pagingToolbar
							.on('beforechange', me.onPageChange, me);
				}

				me.mon(picker, {
							itemclick : me.onItemClick,
							refresh : me.onListRefresh,
							scope : me
						});

				me.mon(picker.getSelectionModel(), {
							'beforeselect' : me.onBeforeSelect,
							'beforedeselect' : me.onBeforeDeselect,
							'selectionchange' : me.onListSelectionChange,
							scope : me
						});
				}else{
				
				}
				return picker;
		
			}
		});