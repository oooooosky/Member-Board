# 회원게시판 간단 요약 (MemberBoard)
# Controller
1. HomeController
    - index를 출력해주는 용도의 Controller
2. MemberController
    - 회원가입, 로그인, 아이디 중복체크, 마이페이지, 관리자용 회원목록 등의 member관련 요청을 받는 Controller
3. BoardController
    - 게시글 목록, 게시글 작성, 게시글 상세조회, 게시글 수정 등의 board관련 요청을 받는 Controller
4. CommentController
    - 댓글 저장, 댓글 삭제 등 comment 관련 요청을 받는 Controller

# DTO
1. MemberDTO
    - 회원가입 및 회원정보 수정 시 데이터를 받는 DTO
2. BoardDTO
    - 게시글 작성 및 게시글 수정 시 데이터를 받는 DTO
3. CommentDTO
    - 댓글 작성 시 데이터를 받는 DTO

# Service
1. MemberService
    - member관련 요청 값을 처리하거나 Repository에 전달하는 Service
2. BoardService
    - board관련 요청 값을 처리하거나 Repository에 전달하는 Service
3. CommentService
    - comment관련 요청값을 처리하거나 Repository에 전달하는 Service

# Interface
1. MemberInterface
    - member 관련 메서드 관리
3. BoardInterface
    - board 관련 메서드 관리
5. CommentInterface
    - comment 관련 메서드 관리

# Repository
1. MemberRepository
    - member관련 DB에 정보를 요청 및 Service에 전달하는 Repository
2. BoardRepository
    - board관련 DB에 정보를 요청 및 Service에 전달하는 Repository
3. CommentRepository
    - comment관련 Db에 정보를 요청 및 Service에 전달하는 Repository

# mapper
1. member-mapper
    - member관련 Repository에서 요청한 작업을 처리하는 mapper
2. board-mapper
    - board관련 Repository에서 요청한 작업을 처리하는 mapper
3. comment-mapper
    - comment관련 Repository에서 요청한 작업을 처리해는 mapper

# DB (MySQL)
1. member_table
    - m_number(pk), m_id(unique), m_pw, m_name, m_email, m_phome, m_filename
2. board_table
    - b_number(pk), b_title, b_writer(m_id 참조), b_contents, b_hits, b_date, b_filename
3. comment_table
    - c_number(pk), b_number(b_number 참조), c_writer(m_id 참조), c_contents, c_date

# index.jsp
- 회원가입 & 로그인 페이지로 가는 링크가 있는, 실행 시 기본으로 열리는 jsp

# join.jsp
- index.jsp에서 Sign Up을 누르면 열리는 jsp.
- MemberController의 joinForm 메서드가 실행되면서 join.jsp가 열림
- input태그로 필요한 정보를 입력받음.
- file(이미지)를 첨부할 수 있음.
- onkeyup을 통해 idDuplicate() 함수가 실행, 아이디 중복체크를 할 수 있음.
- 회원가입에 성공하면 index.jsp로 돌아감.
- 취소를 누를 시 index.jsp로 돌아가게 설정

# login.jsp
- index.jsp에서 Sign In을 누르면 열리는 jsp.
- MemberController의 loginForm 메서드가 실행되면서 login.jsp가 열림
- input태그로 ID와 PW를 입력받음.
- 로그인 시도 시 MemberController의 login 메서드가 실행되면서 성공 시 board의 findAll이 열림
- 로그인 실패 시 화면이 안넘어가게 설정
- 취소를 누를 시 index.jsp로 돌아가게 설정
- admin(관리자)가 로그인 시 main.jsp가 열리도록 설정

# main.jsp
- 관리자 전용 jsp
- 회원 목록 조회, 게시판, 로그아웃 하는 버튼이 있음.

# findAll.jsp
- board/findAll.jsp
- 게시글을 전부 볼 수 있는 jsp.
- 최근 게시글 순으로 페이지당 5개씩 보임
- 화면에 보이는 페이지의 총 갯수는 3개로 페이징 처리가 되있음.
- 검색기능을 통해 제목 또는 작성자 검색을 할 수 있음.
- myPage로 가는 버튼과 logout 버튼이 있음.
- 글 작성을 할 수 있는 버튼이 있음
- 관리자는 게시글 삭제버튼과 관리자용 페이지로 가는 버튼이 있음.

# myPage.jsp
- 회원 정보를 수정 할 수 있는 jsp.
- findAll에서 myPageForm을 요청하면 myPage.jsp가 실행됨.
- 이메일, 전화번호, 사진을 변경 할 수 있음.
- 비밀번호를 입력받아 틀리면 alert창으로 '비밀번호가 틀립니다' 창이 출력.
- 변경버튼을 누를 시 update메서드가 실행.
- update메서드에서 사진 변경이 없을 시 이메일, 전화번호만 변경하는 Repository 메서드로 가게됨.
- update메서드에서 사진 변경이 있을 시 이메일, 전화번호, 파일을 변경하는 Repostiory 메서드로 가게됨.
- 변경 완료 시 board/findAll.jsp로 가게됨
- 취소 버튼을 누르면 board/findAll로 가게함.

# save.jsp
- findAll.jsp에서 게시글 작성을 하면 열리는 jsp.
- saveForm 메서드를 통해 열림.
- 작성자는 sessionScope.loginId를 통해 미리 작성이 되있고, readonly 속성을 줘 변경이 불가능
- input태그로 제목과 내용, 사진을 받음.
- 작성 버튼을 누를 시 BoardController의 saveFile 메서드가 실행.
- 취소 버튼을 누를 시 board/findAll로 가게됨.
- 작성 성공 시 board/findAll로 가게됨.

# detail.jsp (board)
- board/findAll.jsp에서 각 게시글의 제목을 누르면 열리는 jsp.
- board/findAll.jsp에서 안보여주던 사진 및 내용 등 상세한 정보를 볼 수 있음.
- 댓글 작성 기능이 있음.
- 댓글 작성 시 댓글 작성자는 로그인 한 사람의 아이디로 고정
- 게시글 삭제 및 수정 버튼은 게시글 작성자만 보이게 구현
- 댓글 삭제버튼은 댓글 작성자 본인만 볼 수 있게 구현
- 취소버튼을 누르면 detail.jsp로 가기전 페이지로 돌아가게 구현

# update.jsp (board)
- board/detail.jsp에서 수정버튼을 누르면 열리는 jsp.
- 작성자는 로그인한 사람의 아이디로 고정 및 readonly 속성으로 변경이 불가능하게 막아놓음
- 제목과 내용 및 사진을 수정할 수 있게 처리
- 사진 수정이 없을 시 Service에서 제목과 내용만 변경하는 Repository 메서드로 보냄.
- 사진 수정이 있을 시 Service에서 제목과 내용, 사진까지 변경하는 Repository 메서드로 보냄.
- 취소버튼을 누를 시 board/findAll.jsp로 가지게 함.

# memberView.jsp
- 관리자용 회원목록 jsp.
- main에서 memberList 버튼을 누르면 오게 되는 페이지
- 각 회원들의 간단한 정보가 표 형식으로 출력, 각 회원마다 상세조회 및 삭제를 할 수 있는 버튼이 있음
- 상세조회를 하면 member/detail.jsp가 열림
- 삭제를 누르면 회원이 삭제됨.
- 관리자용 페이지로 돌아가는 버튼이 있음.

# detail.jsp (member)
- memberView.jsp에서 상세조회를 누르면 오게되는 페이지
- memberView.jsp에서는 보지 못했던 사진 등의 정보를 볼 수 있음.
- memberView.jsp로 돌아가는 버튼이 있음
