<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/shop_header.jsp"%>
<style>
.updown{
	position: relative; bottom:13px;
}
</style>
<div class="container mt-4">
<form name="orderform" id="orderform" method="post" class="orderform" action="/shop/order" onsubmit="return false;">

        <input type="hidden" name="cmd" value="order">
        <div class="basketdiv" id="basket">
            <div class="row head">
                <div class="subdiv">
                    <div class="check">선택</div>
                    <div class="img">이미지</div>
                    <div class="pname">상품명</div>
                </div>
                <div class="subdiv">
                    <div class="basketprice">가격</div>
                    <div class="num">수량</div>
                    <div class="sum">합계</div>
                </div>
                <div class="subdiv">

                    <div class="basketcmd">삭제</div>
                </div>
                <div class="split"></div>
            </div>
    
            <div class="row data">
                <div class="subdiv">
                    <div class="check"><input type="checkbox" name="buy" value="260" checked="" onclick="javascript:basket.checkItem();">&nbsp;</div>
                    <div class="img"><img src="/display/product/${productNo}" width="80" height="80"></div>
                    <div class="pname">
                        <span>${product.productName}</span>
                    </div>
                </div>
                <div class="subdiv">
                    <div class="basketprice"><input type="hidden" name="p_price" id="p_price1" class="p_price" value="<fmt:parseNumber
									value="${(product.productPrice - (product.productPrice*product.productSale * 0.01))}"
									integerOnly="true" />"><fmt:parseNumber
									value="${(product.productPrice - (product.productPrice*product.productSale * 0.01))}"
									integerOnly="true" />원</div>
                    <div class="num">
                        <div class="updown">
                            <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num"  value="${orderQN}" onkeyup="javascript:basket.changePNum(1);">
                            <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                            <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                        </div>
                    </div>
                    <div class="sum"><fmt:parseNumber value="${(product.productPrice - (product.productPrice*product.productSale * 0.01)) * orderQN}" integerOnly="true" />원</div>
                </div>
                <div class="subdiv">
                    <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
                </div>
            </div>
            <div class="row data">
                <div class="subdiv">
                    <div class="check"><input type="checkbox" name="buy" value="261" checked="" onclick="javascript:basket.checkItem();">&nbsp;</div>
                    <div class="img"><img src="https://mdbcdn.b-cdn.net/img/new/standard/nature/111.webp" width="80" height="80"></div>
                    <div class="pname">
                        <span>남녀 공용 오버핏 반팔티</span>
                    </div>
                </div>
                <div class="subdiv">
                    <div class="basketprice"><input type="hidden" name="p_price" id="p_price2" class="p_price" value="19000">19,000원</div>
                    <div class="num">
                        <div class="updown">
                            <input type="text" name="p_num2" id="p_num2" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(2);">
                            <span onclick="javascript:basket.changePNum(2);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                            <span onclick="javascript:basket.changePNum(2);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                        </div>
                    </div>
                    <div class="sum">19,000원</div>
                </div>
                <div class="subdiv">
                    <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
                </div>
            </div>
            <div class="row data">
                <div class="subdiv">
                    <div class="check"><input type="checkbox" name="buy" value="262" checked="" onclick="javascript:basket.checkItem();">&nbsp;</div>
                    <div class="img"><img src="https://mdbcdn.b-cdn.net/img/new/standard/nature/111.webp" width="80" height="80"></div>
                    <div class="pname">
                        <span>보스톤 가방 18인치 (ab-380)</span>
                    </div>
                </div>
                <div class="subdiv">
                    <div class="basketprice"><input type="hidden" name="p_price" id="p_price3" class="p_price" value="15200">15,200원</div>
                    <div class="num">
                        <div class="updown">
                            <input type="text" name="p_num3" id="p_num3" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(3);">
                            <span onclick="javascript:basket.changePNum(3);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                            <span onclick="javascript:basket.changePNum(3);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                        </div>
                    </div>
                    <div class="sum">15,200원</div>
                </div>
                <div class="subdiv">
                    <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
                </div>
            </div>
    
        </div>

        <div class="right-align basketrowcmd">
            <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
            <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
        </div>

        <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: ${orderQN + 2}개</div>
        <div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액: <fmt:parseNumber value="${(product.productPrice - (product.productPrice*product.productSale * 0.01)) * orderQN + 34200}" integerOnly="true" />원</div>

        <div id="goorder" class="">
            <div class="clear"></div>
            <div class="buttongroup center-align cmd">
                <button type="button" id="send">선택한 상품 주문</button>
            </div>
        </div>
    </form>
</div>

<script src="/resources/js/shop_cart.js"></script>
<%@ include file="../include/footer.jsp" %>