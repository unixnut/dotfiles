<!--  (XSL Transformation) -->
<!--  -->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="" />

  <!-- Suppress built-in processing of all text nodes -->
  <xsl:template match="text()"/>
  

  <xsl:template match="">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="">
    <xsl:copy/>
  </xsl:template>
</xsl:stylesheet>
