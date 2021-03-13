<?php
include 'server.php';
/*
เราใช้ post.php เป็นทั้งไฟล์ที่ทำการแสดงผลและบันทึกข้อมูลกระทู้ใหม่
ดังนั้นเราจะตรวจสอบว่าการเรียกไฟล์นี้นั้นเป็นการบันทึกหรือไม่ด้วยค่าของตัวแปร $_SERVER['REQUEST_METHOD']
ซึ่งมันจะมีค่าเป็น 'POST' หากมีการ submit มาจาก <form> ที่มี method="post"
*/
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	/*
	ตรวจสอบให้แน่ชัดว่ามีข้อมูลที่จำเป็นส่งมาครบหรือไม่ด้วย isset()
	ซึ่งจะเป็นจริงหากใน $_POST มี key ที่ต้องการครบ
	*/
	if (!isset($_POST['title'], $_POST['description'], $_POST['name'])) {
		/*
		หากไม่ครบก็ให้ redirect ไปที่ index.php
		*/
		header('Location: index.php');
		exit;
	}
	/*
	เราจะ copy $_POST มาไว้ในตัวแปร $DATA
	ด้วยเหตุผลที่ว่าเราจะไม่เปลี่ยนแปลงค่าของ $_POST โดยตรง
	และเพื่อให้เป็นแนวทางเดียวกันกับทุกตัวแปรที่จะส่งไปยัง template
	*/
	$DATA = $_POST;
	/*
	ทำการ trim() (ตัดช่องว่างหน้าและหลัง) ของข้อมูลใน $DATA ทุกตัว
	*/
	foreach ($DATA as $key => $value) {
		$DATA[$key] = trim($value);
	}
	/*
	ตรวจสอบว่า $DATA['title'] เป็นค่าว่างหรือไม่
	จะเห็นว่าเราใช้ === เปรียบเทียบกับ empty string โดยไม่ใช้ empty() หรือ !$DATA['title']
	เพราะการเปรียบเทียบด้วยวิธีหลังเป็นการเปรียบเทียบแบบ loose คือมันจะเป็นจริงได้ในหลายกรณีเกินไป
	เช่น เมื่อ $DATA['title'] มีค่าเท่ากับ string '0' ซึ่งไม่ตรงความต้องการของเราแน่ๆ
	*/
	if ($DATA['title'] === '') {
		/*
		กำหนดค่าให้กับตัวแปร $FORM_ERRORS เพื่อนำไปใช้ใน inc/form_errors.inc.php ต่อไป
		*/
		$FORM_ERRORS['title'] = "กรุณาระบุ 'หัวข้อ'";
	}
	/*
	และตรวจสอบความยาวของ $DATA['title'] ว่ามีความยาวมากกว่าที่กำหนดหรือไม่
	ด้วย mb_strlen() ซึ่งเราไม่ใช้ strlen()
	เพราะว่า strlen() จะตรวจจำนวน byte ไม่ใช่จำนวนตัวอักษร
	ซึ่งปัจจุบันเราใช้ encoding ชนิด UTF-8 เป็นหลัก ตัวอักษร 1 ตัวอาจจะมีความยาวมากกว่า 1 byte
	อย่างภาษาไทย ทุกตัวอักษรจะมีขนาด 3 bytes
	*/
	elseif (mb_strlen($DATA['title'], 'UTF-8') > 255) {
		$FORM_ERRORS['title'] = "'หัวข้อ' ต้องมีความยาวไม่เกิน 255 ตัวอักษร";
	}
	/*
	ทำการตรวจสอบกับข้อมูลอื่นๆ เช่นเดียวกัน
	*/
	if ($DATA['description'] === '') {
		$FORM_ERRORS['description'] = "กรุณาระบุ 'รายละเอียด'";
	} elseif (mb_strlen($DATA['description'], 'UTF-8') > 65535) {
		$FORM_ERRORS['description'] = "'รายละเอียด' ต้องมีความยาวไม่เกิน 65535 ตัวอักษร";
	}
	if ($DATA['name'] === '') {
		$FORM_ERRORS['name'] = "กรุณาระบุ 'ชื่อ'";
	} elseif (mb_strlen($DATA['name'], 'UTF-8') > 64) {
		$FORM_ERRORS['name'] = "'ชื่อ' ต้องมีความยาวไม่เกิน 64 ตัวอักษร";
	}
	/*
	ถ้าไม่มีตัวแปร $FORM_ERRORS ถูกสร้างขึ้นมาจากการตรวจสอบข้างต้น แสดงว่าไม่มี error
	ข้อมูลทั้งหมดสามารถ INSERT เข้าฐานข้อมูลได้อย่างปลอดภัย
	*/
	if (!isset($FORM_ERRORS)) {
		/*
		ทำการเชื่อมต่อกับฐานข้อมูล ดู (inc/mysqli.inc.php)
		ซึ่งเราไม่จำเป็นต้องเชื่อมต่อตั้งแต่แรกเพราะยังไม่จำเป็นต้องใช้จนกว่าจะแน่ใจว่าข้อมูลนั้นถูกต้องทั้งหมด
		*/
		require 'inc/mysqli.inc.php';
		/*
		ส่ง SQL query ไปยัง MySQL Server ด้วย mysqli::query()
		โดยเราจะ escape ข้อมูลที่มาจากภายนอกทั้งหมดด้วย mysqli::escape_string()
		โดยใช้ฟังก์ชั่น sprintf() ช่วย ดู (inc/main.inc.php สำหรับ sprintf())
		*/
		$mysqli->query(
			/*
			mysqli::escape_string() จะแปลงตัวอักษรพิเศษ เช่น ' ให้เป็น \' หรือ ''
			ซึ่งทำให้ MySQL Server รู้ว่ามันเป็นข้อมูล ไม่ใช่ delimeter
			หากเราไม่ใช้ mysqli::escape_string() และผ่านข้อมูลไปเป็น SQL query โดยตรง
			อาจจะทำให้เกิด error หรือ SQL Injection ขึ้นได้
			และนี่คือข้อดีของการใช้ mysqli ในแบบ OOP คือจะเห็นว่าเราสามารถแทนที่
			$mysqli->escape_string() ลงไปใน double quote string ได้เลย
			แต่ถ้าเราใช้ mysqli_escape_string() ที่เป็น procedural style
			จะไม่สามารถทำแบบนี้ได้
			*/
			"
			INSERT INTO `topic`
			(
				`last_commented`,
				`title`,
				`description`,
				`name`,
				`ip`
			)
			VALUES
			(
				NOW(),
				'{$mysqli->escape_string($DATA['title'])}',
				'{$mysqli->escape_string($DATA['description'])}',
				'{$mysqli->escape_string($DATA['name'])}',
				'{$_SERVER['REMOTE_ADDR']}'
			)
			"
		);
		/*
		redirect ไปยัง index.php โดยส่ง query string ชื่อ highlight_id
		ที่มีค่าเป็น id ของแถวที่เพิ่ง INSERT เข้าไปในตาราง topic ไปด้วย
		เพื่อใช้เน้นสีพื้นหลังของกระทู้ใหม่ (ดู inc/index.inc.php)
		*/
		header('Location: index.php?highlight_id=' . $mysqli->insert_id);
		/*
		จบการทำงาน
		*/
		exit;
	}
	/*
	หากมี error ก็จะแสดงผลให้ผู้ใช้แก้ไขข้อมูลให้ถูกต้อง
	*/
} else {
	/*
	หากไม่ใช่การ POST ก็ให้กำหนดค่า default สำหรับ $DATA ซึ่งจะถูกใช้งานใน inc/post.inc.php
	โดยให้เป็นค่าว่างทั้งหมด
	*/
	$DATA = array(
		'title' => '',
		'description' => '',
		'name' => '',
	);
}
$TAGS = array('PHP', 'JavaScript', 'SQL', 'HTML', 'CSS');
/*
บอก inc/main.inc.php ให้ require ไฟล์ inc/post.inc.php เป็น template
*/
$TITLE = 'ตั้งกระทู้ใหม่';
// $PAGE_TEMPLATE = 'inc/post.inc.php';
// require 'inc/main.inc.php';