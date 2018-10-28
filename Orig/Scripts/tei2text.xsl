<!-- Re-tag IMP document for ELTEC -->
<xsl:stylesheet version="2.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema" 
		xmlns:h="http://www.w3.org/1999/xhtml" 
		xmlns:t="http://www.tei-c.org/ns/1.0"    
		xmlns:eltec="http://distantreading.net/eltec/ns"
		xmlns="http://www.tei-c.org/ns/1.0"
		exclude-result-prefixes="xs h t eltec">

  <xsl:output method="text"/>
  <xsl:template match="/">
    <xsl:value-of select="t:TEI/t:text/t:body"/>
  </xsl:template>
</xsl:stylesheet>
