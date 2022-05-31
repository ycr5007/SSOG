<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>

    <!-- map -->
    <div style="padding: 50px 0px 50px 0px">
      <img
        src="/resources/img/geo.png"
        usemap="#image-map"
        class="geomap"
        style="max-width: 100%; height: auto; align-content: center"
      />
    </div>
    <map name="image-map">
      <area
        target="_blank"
        alt="rf"
        title="rf"
        href="/gangseo"
        coords="27,302,16,312,6,332,7,352,26,364,47,372,66,366,100,360,124,388,142,381,158,356,164,346,155,329,131,296,100,276,62,244,56,237,68,284"
        shape="poly"
      />
    </map>
    <!-- close map -->

    
<%@ include file="./include/footer.jsp" %>