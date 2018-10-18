<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs h"
    xmlns:h="http://www.w3.org/1999/xhtml" 
    xmlns:t="http://www.tei-c.org/ns/1.0" 
    
    xmlns="http://www.tei-c.org/ns/1.0" 
    version="2.0">
    
    <xsl:output omit-xml-declaration="yes" method="text"></xsl:output>

    <xsl:template match="/">
        <xsl:apply-templates select="//t:item"></xsl:apply-templates>
    </xsl:template>
    
    <xsl:variable name="nl">
        <xsl:text>
 </xsl:text>
    </xsl:variable>

    <xsl:template match="t:item">
        <xsl:text>#</xsl:text><xsl:value-of select="translate(.,$nl,' ')"/><xsl:text>
</xsl:text>
     <xsl:apply-templates select=".//t:ref[1]/@target"></xsl:apply-templates><xsl:text>
</xsl:text>              
    </xsl:template>
    
    <xsl:template match="t:ref/@target">
        <xsl:variable name="filename">
            <xsl:value-of select='substring-before(substring-after(.,"/dl/"),".html")'/>
            <xsl:text>.xml</xsl:text>
        </xsl:variable>
        <xsl:text>curl http://nl.ijs.si/imp/dl/xml/</xsl:text>
       <xsl:choose> <xsl:when test="contains($filename,'header')">
            <xsl:value-of select="concat(substring-before($filename,'-header-sl'),'.xml')"/>          
        </xsl:when>
           <xsl:otherwise><xsl:value-of select="$filename"/></xsl:otherwise>
     </xsl:choose>   <xsl:text>&lt; </xsl:text>
        <xsl:value-of select="concat(substring-before(substring-after($filename,'WIKI'),'-'),'.xml')"/>
    </xsl:template>
    
    
    <xsl:template match="* | @* | processing-instruction()"/>

</xsl:stylesheet>
