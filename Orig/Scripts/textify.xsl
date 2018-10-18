<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs h"
    xmlns:h="http://www.w3.org/1999/xhtml" 
    xmlns:t="http://www.tei-c.org/ns/1.0" 
    
    xmlns="http://www.tei-c.org/ns/1.0" 
    version="2.0">

  <xsl:template match="/">
<!--<xsl:message><xsl:value-of select="substring-before(substring-after(//t:titleStmt/t:title,'('),')')"/></xsl:message>
-->    <xsl:apply-templates select="//t:text"/>
  </xsl:template>
  
</xsl:stylesheet>
