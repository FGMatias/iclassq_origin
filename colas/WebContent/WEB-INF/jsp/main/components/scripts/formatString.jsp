<script>
	function normalizeString(str) {
	    return str.normalize("NFD")
	              .replace(/[\u0300-\u036f]/g, "")  
	              .toLowerCase()
	              .trim();
	}
	
	function normalizeStringManual(str) {
	    var accents = {
	        'á': 'a', 'à': 'a',
	        'é': 'e', 'è': 'e', 
	        'í': 'i', 'ì': 'i', 
	        'ó': 'o', 'ò': 'o', 
	        'ú': 'u', 'ù': 'u'
	    };
	    
	    return str.toLowerCase()
	              .split('')
	              .map(char => accents[char] || char)
	              .join('')
	              .trim();
	}
</script>