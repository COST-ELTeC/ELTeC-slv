<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs h"
    xmlns:h="http://www.w3.org/1999/xhtml" 
    xmlns:t="http://www.tei-c.org/ns/1.0"    
    xmlns="http://www.tei-c.org/ns/1.0" 
    version="2.0">
   <!-- by default this stylesheet copies all existing tagging unchanged--> 
    
   <!-- suppress these elements -->
    
    <xsl:template match="t:lb|t:principal"/>
    <xsl:template match="t:note/@place"/>
    <xsl:template match="t:note/@type"/><!-- they are all authorial -->
    <xsl:template match="t:title[@type='reg']"/><!-- they are all identical to the "orig" ones-->
    <xsl:template match="t:title/@type"/>
    
    <!-- suppress these tags only -->
    
    <xsl:template match="t:lg">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- comment out these elements -->
    
    <xsl:template match="t:facsimile|t:front|t:textClass|t:editionStmt">
      <xsl:text disable-output-escaping="yes">&lt;!--</xsl:text>
           <xsl:copy-of select="."/>
        <xsl:text disable-output-escaping="yes">--&gt;</xsl:text>
    </xsl:template>
    
    <!-- tweak these elements -->
    <xsl:template match="t:encodingDesc">
        <encodingDesc n="eltec-0"><p/></encodingDesc>
    </xsl:template>
    
    <xsl:template match="t:publicationStmt">
        <publicationStmt>
            <p/>
        </publicationStmt>
    </xsl:template>
    <xsl:template match="t:langUsage">
        <langUsage>
            <language ident="sl">slovenščina</language>
        </langUsage>
    </xsl:template>
   
   <xsl:template match="t:revisionDesc">
       <revisionDesc>
           <change when="2018-10-11">
               <name>Lou Burnard</name>: converted to ELTeC
           </change>
<xsl:apply-templates/>
       </revisionDesc>
   </xsl:template>
    
    <xsl:template match="t:change">
        <change>
            <xsl:attribute name="when">
                <xsl:value-of select="t:date"/>
            </xsl:attribute>
<xsl:apply-templates/>
        </change>
    </xsl:template>
    <xsl:template match="t:change/t:date"/>
    
    <xsl:template match="t:profileDesc">
        <profileDesc><xsl:apply-templates/>
        <textDesc>
            <xsl:comment>FAKE NEWS AHEAD</xsl:comment>
            <authorGender xmlns="http://distantreading.net/eltec/ns" key="M"/>
            <size xmlns="http://distantreading.net/eltec/ns" key="short"/>
            <canonicity xmlns="http://distantreading.net/eltec/ns" key="medium"/>
            <timeSlot xmlns="http://distantreading.net/eltec/ns" key="T1"/>
            
        </textDesc></profileDesc>
    </xsl:template>
    
    <!-- copy everything else -->
    
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