<?xml version="1.0" encoding="UTF-8"?>
<tileset version="1.10" tiledversion="1.10.2" name="default" tilewidth="32" tileheight="32" tilecount="15" columns="0">
 <grid orientation="orthogonal" width="1" height="1"/>
 <tile id="0">
  <properties>
   <property name="Collision" type="bool" value="false"/>
   <property name="Trigger" type="bool" value="true"/>
  </properties>
  <image width="32" height="32" source="fort.png"/>
 </tile>
 <tile id="1">
  <properties>
   <property name="Collision" type="bool" value="false"/>
   <property name="Trigger" type="bool" value="false"/>
  </properties>
  <image width="32" height="32" source="grass.png"/>
 </tile>
 <tile id="2">
  <properties>
   <property name="Collision" type="bool" value="true"/>
   <property name="Trigger" type="bool" value="false"/>
  </properties>
  <image width="32" height="32" source="horizontal_fence1.png"/>
  <objectgroup draworder="index" id="2">
   <object id="3" x="0.131579" y="14.2105" width="31.8398" height="4.47368"/>
  </objectgroup>
 </tile>
 <tile id="3">
  <properties>
   <property name="Collision" type="bool" value="true"/>
   <property name="Trigger" type="bool" value="false"/>
  </properties>
  <image width="32" height="32" source="horizontal_fence2.png"/>
 </tile>
 <tile id="4">
  <properties>
   <property name="Collision" type="bool" value="true"/>
   <property name="Trigger" type="bool" value="false"/>
  </properties>
  <image width="32" height="32" source="horizontal_fence3.png"/>
 </tile>
 <tile id="5">
  <properties>
   <property name="Collision" type="bool" value="false"/>
   <property name="Trigger" type="bool" value="true"/>
  </properties>
  <image width="32" height="32" source="town.png"/>
 </tile>
 <tile id="6">
  <properties>
   <property name="Collision" type="bool" value="true"/>
   <property name="Trigger" type="bool" value="false"/>
  </properties>
  <image width="32" height="32" source="vertical_fence1.png"/>
 </tile>
 <tile id="7">
  <properties>
   <property name="Collision" type="bool" value="true"/>
   <property name="Trigger" type="bool" value="false"/>
  </properties>
  <image width="32" height="32" source="vertical_fence2.png"/>
 </tile>
 <tile id="8">
  <properties>
   <property name="Collision" type="bool" value="true"/>
   <property name="Trigger" type="bool" value="false"/>
  </properties>
  <image width="32" height="32" source="vertical_fence3.png"/>
 </tile>
 <tile id="9">
  <properties>
   <property name="Collision" type="bool" value="true"/>
   <property name="Trigger" type="bool" value="false"/>
  </properties>
  <image width="32" height="32" source="water1.png"/>
 </tile>
 <tile id="10">
  <properties>
   <property name="Collision" type="bool" value="true"/>
   <property name="Trigger" type="bool" value="false"/>
  </properties>
  <image width="32" height="32" source="water2.png"/>
 </tile>
 <tile id="23">
  <properties>
   <property name="Collision" type="bool" value="true"/>
   <property name="Trigger" type="bool" value="false"/>
  </properties>
  <image width="32" height="32" source="corner_fence1.png"/>
 </tile>
 <tile id="24">
  <properties>
   <property name="Collision" type="bool" value="true"/>
   <property name="Trigger" type="bool" value="false"/>
  </properties>
  <image width="32" height="32" source="corner_fence2.png"/>
 </tile>
 <tile id="25">
  <properties>
   <property name="Collision" type="bool" value="true"/>
   <property name="Trigger" type="bool" value="false"/>
  </properties>
  <image width="32" height="32" source="corner_fence3.png"/>
 </tile>
 <tile id="26">
  <properties>
   <property name="Collision" type="bool" value="true"/>
   <property name="Trigger" type="bool" value="false"/>
  </properties>
  <image width="32" height="32" source="corner_fence4.png"/>
 </tile>
</tileset>
