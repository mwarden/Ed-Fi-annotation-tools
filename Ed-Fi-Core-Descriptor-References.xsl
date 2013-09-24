<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:ann="http://ed-fi.org/annotation" >


	<xsl:output
		method="text"
		media-type="text/plain"/>


	<!-- PARAMETERS -->
	<xsl:param name="currentDate">CURRENT DATE NOT SET</xsl:param>
	
	
	<xsl:template match="xs:element">
		<xsl:variable name="el">
			<xsl:value-of select="ancestor::xs:complexType[1]/@name"/><xsl:text>.</xsl:text><xsl:value-of select="@name"/>
		</xsl:variable>
		<xsl:variable name="spaces" select="'                                                                                          '"/>
		<xsl:value-of select="substring( concat($el, $spaces) , 1, 80)"/>--&gt; <xsl:value-of select="xs:annotation/xs:appinfo/ann:Descriptor"/>
<xsl:text>
</xsl:text>
		
	</xsl:template>
	
	
	
	
	<xsl:template match="/">
		
		<xsl:text> </xsl:text>==== DESCRIPTOR USAGE ==== 
<xsl:text>
</xsl:text>
		<xsl:for-each select="/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Descriptor']">
			<xsl:variable name="descriptorName" select="@name"/>
			<xsl:value-of select="$descriptorName"/> (<xsl:value-of select="count(//xs:element[xs:annotation/xs:appinfo/ann:Descriptor = $descriptorName])"/>)<xsl:text>:</xsl:text>
			<xsl:for-each select="//xs:element[xs:annotation/xs:appinfo/ann:Descriptor = $descriptorName]">
				<xsl:text>
	</xsl:text><xsl:value-of select="ancestor::xs:complexType[1]/@name"/>.<xsl:value-of select="@name"/>

			</xsl:for-each>
<xsl:text>


</xsl:text>	
		</xsl:for-each>
		


<xsl:text>



</xsl:text>

		<xsl:text> </xsl:text>==== DESCRIPTOR REFERENCE RESOLUTION ==== 
<xsl:text>
</xsl:text>
		<xsl:apply-templates select="//xs:element[@type='DescriptorReferenceType' 
							or @type='AccountCodeDescriptorReferenceType' 
							or @type='PerformanceLevelDescriptorReferenceType' 
							or @type='ServiceDescriptorReferenceType'
						]"/>
<xsl:text>

</xsl:text>	

	</xsl:template>






</xsl:stylesheet>