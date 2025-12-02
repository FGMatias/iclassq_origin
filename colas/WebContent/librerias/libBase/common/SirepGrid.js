Ext.define("grid.SirepGrid",{
    extend: "Ext.grid.Panel",
    alias : 'widget.sireGrid',
    reconfigurarColumnas : function(store, columns) {

        var me = this;
		
        if (me.lockable) {
            me.reconfigureLockable(store, columns);
            return;
        }

        if (columns) {
            me.headerCt.removeAll();
            me.headerCt.add(columns);
        }

        if (store) {
            store = Ext.StoreManager.lookup(store);
            me.bindStore(store);

        } else {
            me.getView().refresh();
        }
    },
    createStore:function(){
    	
    	var me=this;
    	var nameModel=me.nameModel;
    	Ext.define(nameModel || 'Model', {
	    	extend: 'Ext.data.Model',
		    fields: me.fields
    	});
    	
    	var store = Ext.create('Ext.data.JsonStore', {
 	       model: nameModel,
 	        proxy: {
 	            type: 'ajax',
 	            url: me.url,
 	            reader: me.readerStore ||  {
 	                type: 'json',
 	                root: 'data',
 	                totalProperty: 'total'
 	            }
 	            ,extraParams:me.extraParams || {}
 	        },sorters: me.sorters || []
 	    });
    	
    	return store;
    	
    },
    initComponent : function() {
        var me=this;
        this.textMask = 'Obteniendo Registros';
        this.loadMask = true;
        var gridStore = me.createStore();
        gridStore.grid=me;	
        
        this.store = gridStore;
        
        if(me.loadStore){
        	gridStore.load();
        }
        this.callParent(arguments);
    }
});


