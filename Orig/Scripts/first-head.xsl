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
    <xsl:for-each select="//tei:TEI/tei:text/tei:body/tei:div[1]">
      <xsl:if test="not(
		    matches(tei:head, '^I\.') or
		    matches(tei:head, '^I$') or
		    matches(tei:head, '^1\.') or
		    matches(tei:head, '^prvi del', 'i') or
		    matches(tei:head, '^prvo poglavje', 'i')
		    )">
	<xsl:value-of select="ancestor::tei:TEI/@xml:id"/>
	<xsl:text>&#9;</xsl:text>
	<xsl:value-of select="tei:head"/>
	<xsl:text>&#10;&#9;&#9;</xsl:text>
	<xsl:value-of select="following-sibling::tei:div[1]/tei:head"/>
	<xsl:text>&#10;</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
