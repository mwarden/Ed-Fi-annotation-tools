<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:ann="http://ed-fi.org/annotation" >


	<xsl:output
		method="text"
		media-type="text/plain"/>


	<!-- PARAMETERS -->
	<xsl:param name="currentDate">CURRENT DATE NOT SET</xsl:param>
	
	<xsl:template match="/">


		<xsl:text> </xsl:text>==== Elements Missing the TypeGroup Tag (<xsl:value-of select="(count(/xs:schema/xs:complexType[not(xs:annotation/xs:appinfo/ann:TypeGroup)])+count(/xs:schema/xs:simpleType[not(xs:annotation/xs:appinfo/ann:TypeGroup)]))"/>) ==== 
<xsl:text>
</xsl:text>
		<xsl:apply-templates select="/xs:schema/xs:complexType[not(xs:annotation/xs:appinfo/ann:TypeGroup)]"/>
		<xsl:apply-templates select="/xs:schema/xs:simpleType[not(xs:annotation/xs:appinfo/ann:TypeGroup)]"/>
<xsl:text>

</xsl:text>	




		<xsl:text> </xsl:text>==== Domain Entities (<xsl:value-of select="(count(/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Domain Entity'])+count(/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Domain Entity']))"/>) ==== 
<xsl:text>
</xsl:text>
		<xsl:apply-templates select="/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Domain Entity']"/>
		<xsl:apply-templates select="/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Domain Entity']"/>
<xsl:text>

</xsl:text>



		<xsl:text> </xsl:text>==== All Descriptors (<xsl:value-of select="(count(/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Descriptor'])+count(/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Descriptor']))"/>) ==== 
<xsl:text>
</xsl:text>
		<xsl:apply-templates select="/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Descriptor']"/>
		<xsl:apply-templates select="/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Descriptor']"/>
<xsl:text>

</xsl:text>



		<xsl:text> </xsl:text>==== Descriptors With Required Map (<xsl:value-of select="(
					count(/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Descriptor' 
						and xs:complexContent/xs:extension/xs:sequence/xs:element
						and not(xs:complexContent/xs:extension/xs:sequence/xs:element[@minOccurs = 0]) ])
					+count(/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Descriptor' 
						and xs:complexContent/xs:extension/xs:sequence/xs:element
						and not(xs:complexContent/xs:extension/xs:sequence/xs:element[@minOccurs = 0]) ])
				)"/>) ==== 
<xsl:text>
</xsl:text>
		<xsl:apply-templates select="/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Descriptor' 
						and xs:complexContent/xs:extension/xs:sequence/xs:element
						and not(xs:complexContent/xs:extension/xs:sequence/xs:element[@minOccurs = 0]) ]"/>
		<xsl:apply-templates select="/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Descriptor' 
						and xs:complexContent/xs:extension/xs:sequence/xs:element
						and not(xs:complexContent/xs:extension/xs:sequence/xs:element[@minOccurs = 0]) ] "/>
<xsl:text>

</xsl:text>



		<xsl:text> </xsl:text>==== Descriptors With Optional Map (<xsl:value-of select="(
					count(/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Descriptor' 
						and (xs:complexContent/xs:extension/xs:sequence/xs:element[@minOccurs = 0] 
							or not(xs:complexContent/xs:extension/xs:sequence/xs:element) ) ])
					+count(/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Descriptor' 
						and (xs:complexContent/xs:extension/xs:sequence/xs:element[@minOccurs = 0] 
							or not(xs:complexContent/xs:extension/xs:sequence/xs:element) ) ])
				)"/>) ==== 
<xsl:text>
</xsl:text>
		<xsl:apply-templates select="/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Descriptor' 
						and (xs:complexContent/xs:extension/xs:sequence/xs:element[@minOccurs = 0] 
							or not(xs:complexContent/xs:extension/xs:sequence/xs:element) ) ]"/>
		<xsl:apply-templates select="/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Descriptor' 
						and (xs:complexContent/xs:extension/xs:sequence/xs:element[@minOccurs = 0]
							or not(xs:complexContent/xs:extension/xs:sequence/xs:element) ) ] "/>
<xsl:text>

</xsl:text>




		<xsl:text> </xsl:text>==== Associations (<xsl:value-of select="(count(/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Association'])+count(/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Association']))"/>) ==== 
<xsl:text>
</xsl:text>
		<xsl:apply-templates select="/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Association']"/>
		<xsl:apply-templates select="/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Association']"/>
<xsl:text>

</xsl:text>




		<xsl:text> </xsl:text>==== Base Types (<xsl:value-of select="(count(/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Base'])+count(/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Base']))"/>) ==== 
<xsl:text>
</xsl:text>
		<xsl:apply-templates select="/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Base']"/>
		<xsl:apply-templates select="/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Base']"/>
<xsl:text>

</xsl:text>




		<xsl:text> </xsl:text>==== Extended Reference Types (<xsl:value-of select="(count(/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Extended Reference'])+count(/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Extended Reference']))"/>) ==== 
<xsl:text>
</xsl:text>
		<xsl:apply-templates select="/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Extended Reference']"/>
		<xsl:apply-templates select="/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Extended Reference']"/>
<xsl:text>

</xsl:text>



		<xsl:text> </xsl:text>==== Identity Types (<xsl:value-of select="(count(/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Identity'])+count(/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Identity']))"/>) ==== 
<xsl:text>
</xsl:text>
		<xsl:apply-templates select="/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Identity']"/>
		<xsl:apply-templates select="/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Identity']"/>
<xsl:text>

</xsl:text>








		<xsl:text> </xsl:text>==== Extended Descriptor Reference Types (<xsl:value-of select="(count(/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Extended Descriptor Reference'])+count(/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Extended Descriptor Reference']))"/>) ==== 
<xsl:text>
</xsl:text>
		<xsl:apply-templates select="/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Extended Descriptor Reference']"/>
		<xsl:apply-templates select="/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Extended Descriptor Reference']"/>
<xsl:text>

</xsl:text>



		<xsl:text> </xsl:text>==== Common (<xsl:value-of select="(count(/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Common'])+count(/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Common']))"/>) ==== 
<xsl:text>
</xsl:text>
		<xsl:apply-templates select="/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Common']"/>
		<xsl:apply-templates select="/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Common']"/>
<xsl:text>

</xsl:text>




		<xsl:text> </xsl:text>==== Enumerated Collections (<xsl:value-of select="(count(/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Enumerated Collection'])+count(/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Enumerated Collection']))"/>) ====
<xsl:text>
</xsl:text>
		<xsl:apply-templates select="/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Enumerated Collection']"/>
		<xsl:apply-templates select="/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Enumerated Collection']"/>
<xsl:text>

</xsl:text>





		<xsl:text> </xsl:text>==== Enumerations (<xsl:value-of select="(count(/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Enumeration'])+count(/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Enumeration']))"/>) ====
<xsl:text>
</xsl:text>
		<xsl:apply-templates select="/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Enumeration']"/>
		<xsl:apply-templates select="/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Enumeration']"/>
<xsl:text>

</xsl:text>








		<xsl:text> </xsl:text>==== Simple Types (<xsl:value-of select="(count(/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Simple'])+count(/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Simple']))"/>) ==== 
<xsl:text>
</xsl:text>
		<xsl:apply-templates select="/xs:schema/xs:complexType[xs:annotation/xs:appinfo/ann:TypeGroup='Simple']"/>
		<xsl:apply-templates select="/xs:schema/xs:simpleType[xs:annotation/xs:appinfo/ann:TypeGroup='Simple']"/>
<xsl:text>

</xsl:text>


	</xsl:template>



	<xsl:template match="xs:simpleType | xs:complexType">
		<xsl:value-of select="@name"/><!--: <xsl:value-of select="xs:annotation/xs:appinfo/ann:TypeGroup"/>-->
<xsl:text>
</xsl:text>
		
	</xsl:template>


</xsl:stylesheet>