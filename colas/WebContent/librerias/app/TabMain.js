//TabPrincipal de la Aplicacion
console.log("wwwwillian->>>");
Ext.define('librerias.app.TabMain', {
    extend: 'Ext.tab.Panel',//<<----Herencia
	maxTabWidth: 230,
    border: false,
	activeTab   : 0,  
    enableTabScroll :  true, //hacemos que sean recorridas  
    
    initComponent: function() {
    	console.log("wwww->>>");
        this.tabBar = {
            border: false,
			
        };
        
        this.callParent();
    },
	items: [{
            title: 'Pagina Principal',
            iconCls: 'tabs',
            html:'<body scroll="no"> <!-- Start page content --> <div id="start-div">'+
                 '<div style="float:left;" ><img src="resources/imagenes/help.png" /></div>'+
                 '<div style="margin-left:100px;">'+
                 '<h2 style="display: block; border-bottom: 1px solid teal;padding-bottom: 4px;">Bienvenido: Willian Pillaca Meneses </h2>'+
                '<p> <b>SEDE: </b> </p>'+
            '</div>   	</div> </body>'

        }]
	
});