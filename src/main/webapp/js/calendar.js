/*function payDay() {
	alert('payDay 함수 실행')
}*/

/*온로드 함수로 일정 기록 데이터가 있는 날은 밑줄 표시가 될수 있도록 구현*/
function clickDay(i) {
//	alert('clickDay 함수 실행')

	let countDay= document.getElementsByClassName('under').length;
//	console.log('==========' + countDay); //마지막 날짜를 알려주는 코드가 countDay임

	let td = document.createElement('td'); 
for(let j=0; j < countDay; j++){
	let otherDay = document.getElementsByClassName('under')[j];
//	console.log(otherDay);
//	console.log(otherDay.innerHTML); //클릭한 날짜 출력
	otherDay.style.backgroundColor = '#eeeeee';
//	td.setAttribute('style', 'background-color: rgba( 255, 255, 255, 0.87 );');
}
	let child = document.getElementsByClassName('under')[i - 1];
	console.log(child);
	console.log(child.innerHTML);
	child.style.backgroundColor = 'white ';
//	child.style.textDecoration = 'underline '; //클릭하면 밑줄 그어지는 코드임(나중에 조건 걸어서 일정이 있으면 밑줄 있고, 없으면 없게 지정해보도록)
	
	

	/*조건, 일정 데이터가 있으면 날짜 아래에 밑줄이 표시되게 한다. */
	
	/*조건, 일정 데이터가 있으면 일정 목록을 보여주고 없으면 없다고 보여준다. */
	switch(i) {
		case 2:
			document.getElementById('calendarMemo').innerHTML = '<div>권주영 경조 휴가</div>';
			break;
		case 3:
			document.getElementById('calendarMemo').innerHTML = '<div>김동현 연차 휴가</div>';
			break;
		case 4:
			document.getElementById('calendarMemo').innerHTML = '<div>노지성 체력단력 휴가</div>';
			break;
		case 5:
			document.getElementById('calendarMemo').innerHTML = '<div>개인정보 보호 점검 실시</div>';
			break;
		case 6:
			document.getElementById('calendarMemo').innerHTML = '<div>경영기획팀 워크샵</div>';
			break;
		default:
			document.getElementById('calendarMemo').innerHTML = '<div style="color: gray;">' + i +'일은 일정이 없습니다.</div>';
			break;
	}
}