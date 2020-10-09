<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<!-- not REDIRECTABLE TO MOBILE -->

<html lang="ko">
<link rel= "shortcut icon" href="/images/favicon.ico">
<head>
    <!-- #include virtual="/Include/Meta.asp"-->
    <c:import url="/WEB-INF/views/Include/Meta.jsp"/>
    <title>비트교육센터</title>
    <!-- #include virtual="/Include/ContentStyle.asp"-->
    <c:import url="/WEB-INF/views/Include/contentStyle.jsp"/>
    <!-- #include virtual="/Include/Script.asp"-->
    <c:import url="/WEB-INF/views/Include/Script.jsp"/>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- .btn_refundView 및 .btn_refundView2는 /JS/Common.js 에 이벤트핸들러 정의 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/common_css/Common_CSS_Detail_720_1709.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/common_css/Common_CSS_Detail_720plus_1709.css" >

    <!-- #include virtual="/Include/HeaderScript1709.asp"-->
    <c:import url="/WEB-INF/views/Include/HeaderScript1709.jsp"/>
    <script type="text/javascript">
        $(document).ready(function(){
            <!--#include virtual="/Include/Common_eventHandlers_SNB_1709.inc"-->
            <c:import url="/WEB-INF/views/Include/Common_eventHandlers_SNB_1709.jsp"/>
            <!--#include virtual="/Include/HeaderScriptReady1709.inc"-->
            <c:import url="/WEB-INF/views/Include/HeaderScriptReady1709.jsp"/>

            $(".snb_1709 a.newdepth1").eq(1).addClass("on");				// 국가기간전략산업직종
            $(".snb_1709 .newdepth2_wrap").eq(1).addClass("on");		// 국가기간전략산업직종
            $(".snb_1709 .newdepth2_wrap.no2").find("li a").eq(2).addClass("on");  // 라즈베리파이를 활용한 IoT 서비스 고급인력 양성과정
        });
    </script>
    <script language="javascript">
        /*
            var uAgent = navigator.userAgent.toLowerCase();

            var mobilePhones = new Array('iphone', 'ipod', 'ipad', 'android', 'blackberry', 'windows ce','nokia', 'webos', 'opera mini', 'sonyericsson', 'opera mobi', 'iemobile');
    //alert( uAgent );
            for (var i = 0; i < mobilePhones.length; i++)
                if (uAgent.indexOf(mobilePhones[i]) > -1)
                   document.location = "http://www.bitacademy.com/Course/Kukka/M/Course_Kukka_EmbeddedLinux_2017.asp";
        */
    </script>
    <!-- #include virtual="/Include/Script_MoBon_1803.asp"-->
</head>
<style>
    /* white and narrowSNB */
    .moveTop { width:175px !important; background:#17538e url('${pageContext.request.contextPath}/assets/Images/Common/btn_moveTop.png') 50px center no-repeat; }
    #Container_Wrap { min-height:initial; }
    ul.newdepth3_wrap li.long { letter-spacing:-1px; }
    ul.newdepth2_wrap li.long { letter-spacing:-1px; }
</style>

<body>
<div id="Wrapper">
    <!-- Header_Wrap -->
    <!-- #include virtual="/Include/HeaderHTML1709.asp"-->
    <c:import url="/WEB-INF/views/Include/HeaderHTML1709.jsp"/>
    <!-- //Header_Wrap -->
    <hr>
    <div id="Container_Wrap">
        <!-- Content_Wrap -->
        <div id="Content_Wrap">
            <!-- SNB_Wrap-->
            <!-- #include virtual = "/Include/SNB_CourseSupport_1709.asp"-->
            <c:import url="/WEB-INF/views/Include/SNB_CourseSupport_1709.jsp"/>
            <!-- //SNB_Wrap-->
            <!-- Content -->
            <div id="Content">
                <div class="hGroup1709">
                    <p>
                        <img src="${pageContext.request.contextPath}/assets/Images/Icons/icn_Home.png"/>
                        <img src="${pageContext.request.contextPath}/assets/Images/Icons/icn_ArrowTriangleRight.png"/>무료취업과정
                        <img src="${pageContext.request.contextPath}/assets/Images/Icons/icn_ArrowTriangleRight.png"/>국가기간전략산업직종
                        <img src="${pageContext.request.contextPath}/assets/Images/Icons/icn_ArrowTriangleRight.png"/>IoT를 활용한 자바 웹&amp;바일 고급인력 양성과정
                    </p>
                    <h4 style="float:left; letter-spacing:0px;" >IoT를 활용한 자바 웹&amp;모바일<br/>고급인력 양성과정</h4>
                    <!-- 수강신청btn -->
                    <a href="/Register/Request/register_kukka1.asp" title="지원하기" style="float:right; margin-top:24px; font-size:20px;" class="btnBlueBorder">
                        <!--<img src="/Images/Btns/btn_ApplyCourse.png"/>-->
                        지원하기
                    </a>
                    <div style="clear:both; height:10px;"></div>
                </div>

                <section>
                    <div class="con_wrap1709 first">
                        <div class="divTable">
                            <table style="box-shadow:none !important;">
                                <colgroup>
                                    <col style="width:13%">
                                    <col style="width:37%">
                                    <col style="width:13%">
                                    <col style="width:37%">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>교육기간</th>
                                    <td>
                                        <!-- #include virtual="/Include/CourseDateTime/Date/Date__KUKA18_RD.inc" -->
                                        <c:import url="/WEB-INF/views/Include/CourseDateTime/Date/Date__KUKA18_BD.jsp"/>
                                    </td>
                                    <th>강의시간</th>
                                    <td>
                                        <%--<%--%>
                                            <%--'//<!-- # i n c  lude virtual="/Include/CourseDateTime/Time/Time__KUKA18_RD.inc" -->--%>
                                        <%--%>--%>
                                        09:00 ~ 18:00 (8시간/총960시간)
                                    </td>
                                </tr>
                                <tr>
                                    <th>교육비용</th>
                                    <td>무료</td>
                                    <th>교육비지원</th>
                                    <td>국비지원</td>
                                </tr>
                                <tr>
                                    <th>교육정원</th>
                                    <td>25명</td>
                                    <th>문의</th>
                                    <td>02-3486-3456<br/>(acidstar@bit.kr)</td>
                                </tr>
                                </tbody>
                            </table>
                            <div style="clear:both; height:10px;"></div>
                        </div>
                    </div>

                    <div class="con_wrap1709">
                        <img src="${pageContext.request.contextPath}/assets/Images/kukkaImages/DetailPage_RaspberryPiIoTService1.jpg" style="width:720px"/>
                    </div>

                    <!-- con_wrap1709 -->
                    <div class="con_wrap1709 ">
                        <h5> </h5>
                        <div class="divTable">
                            <table>
                                <colgroup>
                                    <col style="width:30%">
                                    <col style="width:70%">
                                </colgroup>
                                <!--
                                <thead>
                                    <tr>
                                        <th scope="col" class="c">대주제</th>
                                        <th scope="col" class="c">세부내용</th>
                                    </tr>
                                </thead>
                                -->

                                <tbody>
                                <tr>
                                    <td scope="row" class="darker c">
                                        사물 인터넷 서비스 및 플랫폼에 대한 이해
                                    </td>
                                    <td>
                                        사물 인터넷의 개념 및 서비스 구조<br/>
                                        사물인터넷디바이스개념 및 응용서비스 사례연구<br/>
                                        사물인터넷 플랫폼과 클라우드, 오픈소스 플랫폼<br/>
                                        오픈소스 하드웨어에 대한 이해<br/>
                                        사물인터넷과 임베디드시스템 개론
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row" class="darker c">
                                        Linux Administration
                                    </td>
                                    <td>
                                        유닉스/리눅스 역사와 발전<br/>
                                        리눅스 시스템 개요<br/>
                                        리눅스 배포판 설치 및 구성하기<br/>
                                        파티션 및 멀티부팅<br/>
                                        리눅스 명령어I,II<br/>
                                        파이프와 필터<br/>
                                        리눅스 파일시스템구조<br/>
                                        리눅스 파일종류/디렉토리 구조<br/>
                                        vi에디터동작원리/명령어/실습<br/>
                                        쉘 기능과 역할/환경변수/명령어전개<br/>
                                        쉘 프로그래밍<br/>
                                        리눅스 서버구축실무
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row" class="darker c">
                                        Python 기본 프로그래밍
                                    </td>
                                    <td>
                                        파이썬 시작하기<br/>
                                        파이썬 기본구문과 자료형<br/>
                                        파이썬 자료형<br/>
                                        객체의 복사 및 형변환<br/>
                                        클래스와 객체지향프로그래밍<br/>
                                        파일<br/>
                                        함수<br/>
                                        시간다루기<br/>
                                        예외처리<br/>
                                        모듈과패키지<br/>
                                        데이터베이스프로그래밍
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row" class="darker c">
                                        Java Advanced Programming
                                    </td>
                                    <td>
                                        OOP 이해 <br/>
                                        Java OOP Programming<br/>
                                        Java API<br/>
                                        Java Thread Programming<br/>
                                        Java Network Programming
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row" class="darker c">
                                        라즈베리파이 프로그래밍

                                    </td>
                                    <td>
                                        라즈베리파이 이해하기<br/>
                                        라즈비안 설치 및 라즈베리파이 설정<br/>
                                        라즈베리파이GPIO제어프로그래밍(Python)<br/>
                                        센서와 액츄테이터 제어(Python)
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row" class="darker c">
                                        라즈베리파이 시스템 프로그래밍

                                    </td>
                                    <td>
                                        리눅스 시스템 프로그래밍 - 파일 시스템<br/>
                                        리눅스 시스템프로그래밍-프로세스&시그널<br/>
                                        리눅스 시스템프로그래밍<br/>
                                        -IPC(PipeFIFO, MessageQueue, SharedMemory, Semaphore)<br/>
                                        리눅스 시스템프로그래밍- POSIX Thread 제어<br/>
                                        ARM컴파일러<br/>
                                        커너소스 다운로드 및 빌드<br/>
                                        모듈프로그래밍<br/>
                                        디바이스 드라이버프로그래밍<br/>
                                        라즈베리파이GPIO프로그래밍(C)
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row" class="darker c">
                                        라즈베리 파이 네트워크 프로그래밍 및 IoT를위한통신프로토콜

                                    </td>
                                    <td>
                                        네트워크와 네트워킹<br/>
                                        OSI7계층과 인터넷<br/>
                                        소켓인터페이스<br/>
                                        TCP/UDP소켓프로그래밍<br/>
                                        프로토콜 스택 분석<br/>
                                        SOAP<br/>
                                        CoAP<br/>
                                        MQTT

                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row" class="darker c">
                                        Python 웹 프로그밍
                                    </td>
                                    <td>
                                        플라스크 기반의 웹 서비스 개발<br/>
                                        플라스크기방의GPIO푸트 모니터링<br/>
                                        플라스크기반의GPIO포트제어<br/>
                                        미니 프로젝트

                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row" class="darker c">
                                        Node.JS 연동
                                    </td>
                                    <td>
                                        Node.JS 소개 및 라즈베리파이 설치<br/>
                                        NPM실습<br/>
                                        Node.JS기초실습<br/>
                                        wiringPi를 활용한 센서 및 액츄에이터 제어<br/>
                                        파이카메라제어<br/>
                                        ExpressFramework사용법 익히기<br/>
                                        웹 프론트엔드 프로그래밍(JQuery와jQuery Mobile, Bootstrap)<br/>
                                        미니프로젝트

                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row" class="darker c">
                                        라즈베리파이 제어를 위한 Android앱작성하기

                                    </td>
                                    <td>
                                        Android 프로그래밍 I<br/>
                                        Android프로그래밍II<br/>
                                        라즈베리파이 제어를 위한Restful API서버작성<br/>
                                        Android App으로 라즈베리파이 제어하기<br/>
                                        라즈베리파이 캠 연동 앱 작성<br/>
                                        RFID태깅 연동<br/>
                                        GCM활용하기<br/>
                                        미니프로젝트
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row" class="darker c">
                                        프로젝트 수행실습
                                    </td>
                                    <td>
                                        프로젝트 주제 선정<br/>
                                        프로젝트 수행방법론<br/>
                                        프로젝트 수행<br/>
                                        프로젝트 관리 기법
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div style="clear:both;"></div>
                        </div>
                    </div>
                    <!-- con_wrap1709 -->

                    <div class="con_wrap1709">
                        <img src="${pageContext.request.contextPath}/assets/Images/kukkaImages/DetailPage_RaspberryPiIoTService2.jpg" style="width:720px"/>
                        <img src="${pageContext.request.contextPath}/assets/Images/kukkaImages/DetailPage_RaspberryPiIoTService3.jpg" style="width:720px"/>
                    </div>

                    <!--
                                            <div class="con_wrap1709">
                                                <h5>1. 과정 소개</h5>
                                                <p>
                                                    모든 사물을 인터넷을 기반으로 연결하여 사람과 사물, 사물과 사물간의 정보를 상호 소통하는 기술과 서비스인 사물인터넷에 대한 관심이 증대되고 있다. 이에 본 과정은 사물인터넷 플랫폼 서비스 개발 및 디바이스에 대한 지식과 개발능력을 배양하기 위해 IoT에 대한 이해 및 개발을 배우기 위한 지식 및 IoT 디바이스 및 서비스 개발에 기초가 되는 다양한 프로그래밍 언어부터 습득 한 후, IoT 디바이스로 대표적인 오픈소스 하드웨어 라즈베리 파이와 아두이노 기반으로 하드웨어에 대한 지식과 드라이버 개발 커널 빌드등 시스템 및 네트워크 프로그래밍을 학습하고 직접 실습한다. 이 후, 디바이스 개발에 대한 충분한 경험을 바탕으로 IoT 서비스 개발에 필요한 다양한 클라이언트, 서버 기술들을 습득하게 된다.
                                                </p>
                                            </div>

                                            <div class="con_wrap1709">
                                                <h5>2. 교육 특전</h5>
                                                <ul class="pd_l5">
                                                    <li> - 교육비 전액 무료</li>
                                                    <li> - 훈련수당 최대 총 1,896,000원 지급 (지원대상에 따라 훈련수당은 변동됩니다.)</li>
                                                    <li> - 교육수료 후 취업 지원</li>
                                                </ul>
                                            </div>

                                            <div class="con_wrap1709">
                                                <h5>3. 교육 대상</h5>
                                                <ul class="pd_15">
                                                    <li>사물 인터넷에 대한 경험이 필요한 초급 엔지니어</li>
                                                    <li>사물인터넷 디바이스 및 서비스 개발에 관심있는 자</li>
                                                    <li>사물인터넷 서비스 관련 신규 사업을 기획(준비)하는 창업 준비자</li>
                                                    <li>사물인터넷 분야로 진로를 결정한 대학(원)생 및 미취업자</li>
                                                </ul>
                                            </div>

                                            <div class="con_wrap1709">
                                                <h5>4. 모집기간 및 정원</h5>
                                                <p>선착순 마감 / 25명</p>
                                            </div>

                                            <div class="con_wrap1709">
                                                <h5>5. 신청방법</h5>
                                                <p>온라인 수강신청 후 면담신청<br/>전화 - 02-3486-3456<br/>카카오톡 - 플러스친구(비트교육센터 검색)</p>
                                            </div>

                                            <div class="con_wrap1709">
                                                <h5>6. 교육시간</h5>
                                                <p>
                    -->
                    <%--<%--%>
                        <%--'// < ! - -  #include virtual="/Include/CourseDateTime/Time/Time__KUKA18_RD.inc" - - >--%>
                    <%--%>--%>
                    <!--08:50 ~ 18:00 (그룹스터디 포함 22:00까지)<br/>- 총 960시간(6개월)-->
                    <!--
                                                    </p>
                                            </div>

                                            <div class="con_wrap1709">
                                                <h5>7. 교육 기간</h5>
                                                <div class="divTable">
                                                    <table>
                                                        <colgroup>
                                                            <col style="width:25%">
                                                            <col style="width:75%">
                                                        </colgroup>
                                                        <tbody>
                                                            <tr>
                                                                <th scope="col">과정명</th>
                                                                <td style="letter-spacing:-0.5px;"><b>라즈베리파이를 활용한 IoT 서비스 고급인력 양성과정</b></td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="col">교육기간</th>
                                                                <td style="letter-spacing:-0.5px;">
                    -->
                    <%--<%--%>
                        <%--'//												<!-- #include virtual="/Include/CourseDateTime/Date/Date__KUKA18_RD.inc" --> 6개월(120일) 총960시간--%>
                    <%--%>--%>
                    <!--
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="col">교육문의</th>
                                                                <td>02-3486-3456</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div class="con_wrap1709">
                                                <h5>8. 준비 서류</h5>
                                                <p><b>- 실업자 내일배움카드 발급(최소 2주, 최대 5~6주 소요)</b></p>
                                                <p><b>- 취업성공패키지 참여 카드발급(최소 4주 이상)</b></p>
                                                <p><span style="margin-left:7px; background:#ffff99;">참여 훈련생 특혜: 훈련 수당 10만원 지원금 추가  </span></p>
                                                <p style="margin-left:7px; font-size:1em; "><b>* 위의 카드발급은 주소지 관할 고용센터에서 발급 가능합니다.</b></p>
                                                <p style="color:#7f7f7f; font-size:1em; line-height:13px;">※ 단, 훈련장려금은 1개월 단위 출석률이 80% 이상인 경우에만 지급받을 수 있습니다.</p>
                                                <p style="color:#7f7f7f; font-size:1em; line-height:13px;">※ 실업급여를 받으시는 동안이나 공공근로사업에 참여하고 계신 동안에는 훈련장려금을 지급받을 수 없습니다.</p>
                                                <ul class="pd_l5">
                                                    <li>
                                                        <p class="diagram_wrap l" style="margin-top:0px;"><img src="/Images/Content/Diagram/img_course_diagram_06.PNG" style="width:100%;"></p>
                                                    </li>
                                                </ul>
                                                <p> - 증명사진 2매</b><p>
                                            </div>

                                            <div class="con_wrap1709 last">
                                                <h5>9. 교육내용</h5>

                                                <style>
                                                    .specialTable {
                                                        width:20%;
                                                        float:left;
                                                    }
                                                    .specialDiv {
                                                        width:1%;
                                                        padding:0 20px;
                                                        line-height:230px;
                                                        float:left;
                                                    }
                                                    .specialTable tr td {
                                                        border-bottom:initial !important;
                                                        border:1px solid !important;
                                                    }
                                                    .specialTable tr:nth-child(1) td { text-align:center; }
                                                    .specialTable tr:nth-child(2) { height:75px; }
                                                    .specialTable tr:nth-child(3) { height:95px; }
                                                </style>
                                                <table class="specialTable">
                                                    <tr><td>1단계</td></tr>
                                                    <tr><td>IoT에 대한 이해 및 개발을 위한 기본 기술</td></tr>
                                                    <tr><td>IoT 개요, 리눅스, Java, Python 프로그래밍</td></tr>
                                                </table>
                                                <div class="specialDiv">
                                                    →
                                                </div>
                                                <table class="specialTable">
                                                    <tr><td>2단계</td></tr>
                                                    <tr><td>IoT 디바이스 개발</td></tr>
                                                    <tr><td>라즈베리파이를 활용한 시스템 및 네트워크 프로그래밍</td></tr>
                                                </table>
                                                <div class="specialDiv">
                                                    →
                                                </div>
                                                <table class="specialTable">
                                                    <tr><td>3단계</td></tr>
                                                    <tr><td>IoT 서비스 개발</td></tr>
                                                    <tr><td>Pyhton 웹, Node.JS, 라즈베리파이 제어를 위한 안드로이드 앱 작성</td></tr>
                                                </table>
                                                <div class="specialDiv">
                                                    →
                                                </div>
                                                <table class="specialTable">
                                                    <tr><td>4단계</td></tr>
                                                    <tr><td>프로젝트 수행</td></tr>
                                                    <tr><td>라즈베리파이를 활용한 IoT 서비스 프로젝트 수행</td></tr>
                                                </table>
                                                <div style="clear:both;"></div>
                                            </div>
                                            -->
                </section>
            </div>
            <!-- // Content -->
        </div>
        <!-- //Content_Wrap -->
    </div>
    <hr>
    <!-- Footer_Wrap -->
    <!-- #include virtual="/Include/FooterHTML1709.asp"-->
    <c:import url="/WEB-INF/views/Include/FooterHTML1709.jsp"/>
    <!-- //Footer_Wrap -->
</div>
</body>
</html>