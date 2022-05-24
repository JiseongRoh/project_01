function setting(idx, mode, title, name, content) {
	let frm = document.commentForm; // contentView.jsp의 댓글 폼
	// 수정 또는 삭제할 댓글 번호를 넣어준다. 댓글 입력시는 0로 처리한다.
	frm.idx.value = idx;
	// commentOK.jsp에서 사용할 댓글 작업 모드를 넣어준다. 1 => 저장, 2 => 수정, 3 => 삭제
	frm.mode.value = mode;
	// submit 버튼에 표시할 텍스트를 넣어준다.
	frm.commentBtn.value = title;
	// 수정 또는 삭제할 댓글 작성자의 이름을 댓글 폼의 name 속성이 name인 text 상자에 넣어준다.
	frm.name.value = name;
	
	// vo.content를 넘겨받으면 javascript는 이스케이프 시퀀스(\r\n)가 포함된 데이터를 받을 수 없기 때문에
	// 정상 동작하지 않는다.
	// 브라우저에 글을 줄바꿔 출력하기 위해서 \r\n를 <br/>로 치환해서 넣어준 content를 사용해야 하고
	// content의 <br/>를 다시 \r\n을 변경해서 textatrea에 넣어줘야 한다.
	
	// java나 jsp의 replace 메소드는 모든 내용을 일괄적으로 치환하지만 javascript의 replace 함수는 맨 처음
	// 1개만 치환한다.
	// 인수로 넘어온 데이터에 더 이상 <br/>이 없을 때 까지 반복하며 \r\n으로 변경시켜야 한다.
	while (content.indexOf('<br/>') != -1) {
		content =  content.replace('<br/>', '\r\n');
	}
	// 수정 또는 삭제할 댓글 내용을 댓글 폼의 name 속성이 content인 textarea에 넣어준다.
	frm.content.value = content;
	
}





