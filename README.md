# 👶걸음마 (팀명:아장아장)
![Intro](https://github.com/user-attachments/assets/520946a2-2eb8-4206-8836-d14eba4dc238)

# 👀 서비스 소개
* 서비스명: 데이터 기반 초보 부모를 위한 맞춤형 육아 일정 관리 서비스
* 서비스설명:![1-서비스 소개](https://github.com/user-attachments/assets/08f6e42a-a534-4de4-a470-b4ce53d77210)
<br>

# 📅 프로젝트 기간
2024.09.11 ~ 2024.09.25 (2주)
<br>

# ⭐ 주요 기능 및 🖥 화면 구성
## 📱 소셜 로그인 ( 오픈 API - 카카오, 네이버 )
![2-1 소셜로그인 카카오](https://github.com/user-attachments/assets/2040f36e-263a-4f6a-a532-9ba41071d3f2)
![2-2 소셜 로그인 네이버](https://github.com/user-attachments/assets/6fd664d1-76f9-4d2f-8a97-d6882cfe0cfc)

## 🗓️ 일정 관리 기능 ( 날짜별 일정 조회, 일정 추가, TODO 추가)

* 걸음마 달력은 오픈 API가 아닌 직접 코딩으로 달력을 구현함. 
* 자바의 Calendar 객체를 받아와 사용자의 시간에 맞게 실행될 수 있도록 구현함.
* 실시간으로 해당 날짜에 있는 정보를 가져오기 위해 Ajax를 사용하여 구현함.
* 
* 달력안에 있는 공휴일 정보는 한국천문연구원에 있는 공공 API를 이용하여 구현함. 

* 날짜별 일정 조회 ( 날짜 클릭시 해당 날짜에 들어있는 데이터 조회 가능)
![2-2 메인화면](https://github.com/user-attachments/assets/abb46cc3-2057-4a00-853e-a32efa94dfc4)
* 일정 추가
![2-2-1 일정추가](https://github.com/user-attachments/assets/bbbd8971-1481-47bb-af0c-110559f49e33)
* TODO 추가
![2-2-2 TODO추가](https://github.com/user-attachments/assets/287c9a64-2840-4fb1-84f1-3f567da52336)

## 🪧 각 종 게시판 ( 영상추천, 커뮤니티, 중고거래)
* 영상추천 (아장튜브 / 육아 관련 영상 추천)
![2-2-3 영상추천](https://github.com/user-attachments/assets/d4d61449-a19e-4605-8842-a723af4eccd3)
* 커뮤니티 (놀이터 / 게시글 작성, 검색 , 댓글 추가 , 조회수)
![2-2-4 커뮤니티](https://github.com/user-attachments/assets/c4f108c3-a0f2-4b24-bd62-dee3ba100766)
* 중고거래 (걸음마켓 / 게시글 작성, 좋아요, 관심목록-프로필에서 조회가능)
![2-2-5 중고거래](https://github.com/user-attachments/assets/4ecb7861-f55e-43a4-96fa-81df619ffff2)

## 일기 서비스
* 일기 추가
![2-2-6 일기추가](https://github.com/user-attachments/assets/b1c4f39c-c861-4484-a478-4353c930d7c6)
* 일기 조회
![2-2-7 일기 조회](https://github.com/user-attachments/assets/eb8d83a9-71bc-47f5-946b-d431db80f1da)

## 실시간 채팅 (웹소켓)
* 옹알이방
![2-2-8 채팅](https://github.com/user-attachments/assets/629d7fc1-34cc-4200-966f-71d6e4d8b0b2)

## 다크모드
![2-2-9 다크모드](https://github.com/user-attachments/assets/c20b3c89-acdb-4c99-9a75-577431c25a2f)
<br>

## ⛏ 기술스택
<table>
    <tr>
        <th>구분</th>
        <th>내용</th>
    </tr>
    <tr>
        <td>사용언어</td>
        <td>
            <img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=java&logoColor=white"/>
            <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"/>
            <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=white"/>
            <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white"/>
            <img src="https://img.shields.io/badge/python-3776AB?style=for-the-badge&logo=python&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>라이브러리</td>
        <td>
            <img src="https://img.shields.io/badge/kakao-FFCD00?style=for-the-badge&logo=kakao&logoColor=white"/>
            <img src="https://img.shields.io/badge/naver-03C75A?style=for-the-badge&logo=naver&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>개발도구</td>
        <td>
            <img src="https://img.shields.io/badge/Eclipse-2C2255?style=for-the-badge&logo=Eclipse&logoColor=white"/>
            <img src="https://img.shields.io/badge/VSCode-007ACC?style=for-the-badge&logo=VisualStudioCode&logoColor=white"/>
            <img src="https://img.shields.io/badge/jupyter-F37626?style=for-the-badge&logo=jupyter&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>서버환경</td>
        <td>
            <img src="https://img.shields.io/badge/Apache Tomcat-D22128?style=for-the-badge&logo=Apache Tomcat&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>데이터베이스</td>
        <td>
            <img src="https://img.shields.io/badge/Oracle 11g-F80000?style=for-the-badge&logo=Oracle&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>협업도구</td>
        <td>
            <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white"/>
            <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white"/>
        </td>
    </tr>
</table>


<br>

## ⚙ 시스템 아키텍처(구조) 예시 
![4-1 시스템 아키텍쳐](https://github.com/user-attachments/assets/6a16a1ca-6609-4a85-a605-80f29d09e8e8)
<br>

## 📌 서비스 흐름도
![4-2 서비스 흐름도](https://github.com/user-attachments/assets/20e430b7-e56c-4496-a772-2cbcf74be453)
<br>

## 📌 ER다이어그램
![4-3 ER 다이어그램](https://github.com/user-attachments/assets/e958e39e-8658-4ce4-883e-073066a0fce1)
<br>

## 👨‍👩‍👦‍👦 팀원 역할
<table>
  <tr>
    <td align="center"><img src="https://item.kakaocdn.net/do/fd49574de6581aa2a91d82ff6adb6c0115b3f4e3c2033bfd702a321ec6eda72c" width="100" height="100"/></td>
    <td align="center"><img src="https://mb.ntdtv.kr/assets/uploads/2019/01/Screen-Shot-2019-01-08-at-4.31.55-PM-e1546932545978.png" width="100" height="100"/></td>
    <td align="center"><img src="https://mblogthumb-phinf.pstatic.net/20160127_177/krazymouse_1453865104404DjQIi_PNG/%C4%AB%C4%AB%BF%C0%C7%C1%B7%BB%C1%EE_%B6%F3%C0%CC%BE%F0.png?type=w2" width="100" height="100"/></td>
    <td align="center"><img src="https://i.pinimg.com/236x/ed/bb/53/edbb53d4f6dd710431c1140551404af9.jpg" width="100" height="100"/></td>
  </tr>
  <tr>
    <td align="center"><strong>이혜성</strong></td>
    <td align="center"><strong>김원섭</strong></td>
    <td align="center"><strong>남윤서</strong></td>
    <td align="center"><strong>홍성우</strong></td>
  </tr>
  <tr>
    <td align="center"><b>PM / Backend</b></td>
    <td align="center"><b>DB / Crawling</b></td>
    <td align="center"><b>DB / Backend</b></td>
    <td align="center"><b>Frontend</b></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/NAYA0903" target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/자신의username작성해주세요" target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/자신의username작성해주세요" target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/자신의username작성해주세요" target='_blank'>github</a></td>
  </tr>
</table>

## 🤾‍♂️ 트러블슈팅
  
* 문제1<br>
문제점 : 조회수 로직을 a태그 클릭 한번에 조회수 컬럼 값을 1증가로 구현하려고 했지만 <br>
         서블릿을 try-catch-finally 구문으로 작성하였기 때문에 finally에서 세션이 종료되면 다시 열때까지 안열리기에 아이디당 한번 밖에 실행이 안됨 . <br><br>
해결 방안 : try with resources 구문을 사용하여 리소스를 다 사용하고 나서 자동으로 반납하고 다시 호출할때 열리게 함으로써 해결하였음.
 




