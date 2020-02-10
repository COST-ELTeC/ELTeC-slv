<!-- Sniff for liminals -->
<xsl:stylesheet version="2.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema" 
		xmlns:h="http://www.w3.org/1999/xhtml" 
		xmlns:tei="http://www.tei-c.org/ns/1.0"    
		xmlns:eltec="http://distantreading.net/eltec/ns"
		xmlns="http://www.tei-c.org/ns/1.0"
		exclude-result-prefixes="xs h tei eltec">

  <xsl:output method="text"/>
  <xsl:template match="/">
    <xsl:for-each select="//tei:TEI//tei:body//tei:div[tei:p][last()]">
      <xsl:if test="matches(tei:p[last()], 'konec ', 'i')">
	<xsl:value-of select="ancestor::tei:TEI/@xml:id"/>
	<xsl:text>&#9;</xsl:text>
	<xsl:value-of select="tei:p[last()]"/>
	<xsl:text>&#10;</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
