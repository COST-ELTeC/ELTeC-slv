<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs h t e" 
    xmlns:h="http://www.w3.org/1999/xhtml" 
    xmlns:t="http://www.tei-c.org/ns/1.0" 
    xmlns:e="http://distantreading.net/eltec/ns"
    xmlns="http://www.tei-c.org/ns/1.0" 
    version="2.0">
   <!-- by default this stylesheet copies all existing tagging unchanged--> 
    

    <xsl:variable name="fileId">
        <xsl:value-of select="substring-before(substring-after(//t:TEI/@xml:id,'WIKI'),'-')"/>
    </xsl:variable>
    
    <xsl:variable name="fileSize">
        <xsl:value-of select="document('sizes.xml')/sizes/f[@n=$fileId]/@words" />
    </xsl:variable>
    
    <xsl:variable name="textDate">
        <xsl:value-of select="substring-after(//t:TEI/@xml:id,'-')"/>
    </xsl:variable>

<xsl:variable name="pageCount">
    <xsl:value-of select="count(//t:pb)"/>
</xsl:variable>
    
<xsl:variable name="textId">
    <xsl:value-of select="concat('SL',$fileId)"/>
</xsl:variable>
  
<xsl:template match="/">
    <xsl:message><xsl:text>Processing </xsl:text>
    <xsl:value-of select="$textId"/>
  <xsl:text> size is </xsl:text>
    <xsl:value-of select="$fileSize"/>
    <xsl:text> i.e. </xsl:text>
    <xsl:choose>
        <xsl:when test="$fileSize  &lt; 50000">short</xsl:when>
        <xsl:when test="$fileSize &gt; 150000">long</xsl:when>
        <xsl:otherwise>medium</xsl:otherwise></xsl:choose>   
    <xsl:text> date is </xsl:text>
    <xsl:value-of select="$textDate"/>
    <xsl:text> i.e. </xsl:text>
    <xsl:choose>
        <xsl:when test="$textDate &lt; 1860 and $textDate &gt; 1840">T1</xsl:when>
        <xsl:when test="$textDate &lt; 1880 and $textDate &gt; 1860">T2</xsl:when>
        <xsl:when test="$textDate &lt; 1900 and $textDate &gt; 1880">T3</xsl:when>
        <xsl:when test="$textDate &lt; 1920 and $textDate &gt; 1900">T4</xsl:when>
          <xsl:otherwise>????</xsl:otherwise>
    </xsl:choose>
</xsl:message>    
    <xsl:apply-templates/>
    
</xsl:template> 
    
    <xsl:template match="t:TEI/@xml:id">
        <xsl:attribute name="xml:id">
            <xsl:value-of select="$textId"/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="t:titleStmt/t:title">
        <title><xsl:value-of select="concat(substring-before(substring-after(.,':'),'('),' : ELTeC edition')"/></title>
        <author><xsl:value-of select="concat(substring-before(.,':'),' (?-?)')"/></author>  
    </xsl:template>
    
    
    <xsl:template match="e:size/@key">
        <xsl:attribute name="key">
        <xsl:choose>
            <xsl:when test="$fileSize  &lt; 50000">short</xsl:when>
            <xsl:when test="$fileSize &gt; 150000">long</xsl:when>
            <xsl:otherwise>medium</xsl:otherwise></xsl:choose>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="t:publicationStmt">
        <extent>
            <measure unit="words"><xsl:value-of select="$fileSize"/></measure>
            <measure unit="pages"><xsl:value-of select="$pageCount"/></measure>
        </extent>
        <publicationStmt>
            <p>Dodan ELTeC <date>2018-10-11</date></p>
        </publicationStmt>
    </xsl:template>
    
    <xsl:template match="t:sourceDesc/t:bibl">
        <xsl:variable name="titlePageImage">
            <xsl:text>http://nl.ijs.si/imp/wikivir/facs/WIKI</xsl:text>
            <xsl:value-of select="$fileId"/>
            <xsl:text>/WIKI</xsl:text>
            <xsl:value-of select="$fileId"/>
            <xsl:text>-000.png</xsl:text>
        </xsl:variable>
             <bibl>
                 <title><xsl:value-of select="t:title"/></title>
                <author><xsl:value-of select="t:author"/></author>
                <publisher>Digitalna knjižnica <ref target="http://nl.ijs.si/imp/">IMP</ref></publisher>
            <idno type="wikilink"><xsl:value-of select="t:pubPlace/t:ref[1]/@target"/></idno>
             <idno type="urn"><xsl:value-of select="t:pubPlace/t:ref[2]/@target"/></idno>
             </bibl>
            <bibl type="copyText">
                <ref target="$titlePageImage"/></bibl>
    </xsl:template>
    <xsl:template match="e:timeSlot/@key">
       <xsl:attribute name="key"> <xsl:choose>
            <xsl:when test="$textDate &lt; 1860 and $textDate &gt; 1840">T1</xsl:when>
            <xsl:when test="$textDate &lt; 1880 and $textDate &gt; 1860">T2</xsl:when>
            <xsl:when test="$textDate &lt; 1900 and $textDate &gt; 1880">T3</xsl:when>
            <xsl:when test="$textDate &lt; 1920 and $textDate &gt; 1900">T4</xsl:when>
            <xsl:otherwise>????</xsl:otherwise>
       </xsl:choose></xsl:attribute>    </xsl:template>
    
   <!-- fix errors not caught by retag.xsl -->
    
    <xsl:template match="t:choice">
        <corr><xsl:value-of select="t:corr"/></corr>
    </xsl:template>
    
    <xsl:template match="t:encodingDesc/@n">
        <xsl:attribute name="n">eltec-1</xsl:attribute>
    </xsl:template>

    <xsl:template match="* | @* | processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates select="* | @* | processing-instruction() | comment() | text()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="text()">
        <xsl:value-of select="."/>
        <!-- could normalize() here -->
    </xsl:template>
</xsl:stylesheet>