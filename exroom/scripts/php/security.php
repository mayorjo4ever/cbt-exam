<?php 

error_reporting(E_ALL^E_NOTICE);

if(!isset($_SESSION))session_start();

if(!isset($_SESSION['exmUser'])) {
	$_SESSION['logMsg']="<li class='err'>You need to login first.</li>";
	header("Location:../");	
}
	require "../scripts/php/dbActor.php";
	 
	$con = new DbManager();

	$me = $con->getFields($con->selectAnd("student",array('matricno'=>$_SESSION['exmUser'])),array('matricno','surname','firstname','midname','department','sex','dob','passport','level','phone','homeaddress','logid','logdate')); 
	
	if(count($me['matricno'])==0){
		$_SESSION['logMsg']="<li class='err'>Error: please login </li>";
		header("Location:../");
	} 
	
	 $loginfo = $con->getFields($con->selectAnd("studentlogs",array('matricno'=>$_SESSION['exmUser'],'type'=>"lin")),array('logdate'));
	
	 			
////////////////// 
if(isset($_POST['changepsw'])){

	$p1 = $con->clean($_POST['oldps']);
	$p2 = $con->clean($_POST['newps']);
	$p3 = $con->clean($_POST['newps2']);
	
	if($p1==""){	
	$psMsg = "<li class='err'> supply old password</li>";	
	}
	
	else if($p2==""){	
	$psMsg = "<li class='err'> supply new password</li>";	
	}
	
	if($p3==""){	
	$psMsg = "<li class='err'> supply new password again</li>";	
	}
	
	else if($con->toMD5($p2)!= $con->toMD5($p3)){
	$psMsg = "<li class='err'>  new password did not match </li>";	
	}
	else{
		$cnd = array('matricno'=>$me['matricno'][0],'enc_psw'=>$con->toMD5($p2));
		$validPsw = $con->getFields($con->selectAnd('student',$cnd),array('password'));
		
		if(count($validPsw['password'][0]==1)){		
			$psMsg = "<li class='ok'> ".$validPsw['password'][0]. " </li>";
		}
	else {
		$psMsg = "<li class='err'>  wrong password supplied </li>";
	}
	
	}
	
	
	
}
///////////////////////
				
			
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Electronic Examination System</title> 
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<script src="../scripts/js/jquery_1.9.2.js" type="text/javascript">  </script>
<script src="../scripts/js/manageLog.js" type="text/javascript">  </script>
 
<style type="text/css">
 
fieldset {
	width:94px; border:1px solid #3CC;	padding:8px
}
legend{  font-size:10px; font-weight:bold; width:auto;}
th{ font-size:16px; text-transform:capitalize; line-height:40px; height:40px; }
td { line-height:40px; height:40px; font-size:12px;}

</style>
</head>  
<body class="hp">
 <form method="post">
 <input type="hidden" name="nxp" id="nxp" value="<?php echo $_REQUEST['nxp']; ?>"  />
 <div id="window"> electronic examination system <br />
<label class="headlab"> ...because examination matters</label></div>
 <div id="bodyTag">
   <div id="banner"></div>
   <div id="redlight"> <marquee behavior="alternate" direction="left" scrollamount="2"> welcome to federal university of technology, minna's electronic examination system.</marquee> </div>
   <div id="adminMenu"></div>
   <div id="adminBody">
     <table width="96%" border="0" align="center" cellpadding="1" cellspacing="1" class="blueBorder">
       <?php echo $psMsg; ?>
       
        <tr>
         <td class="right paint" scope="row">&nbsp;</td>
         <td class="left over"><b><?php echo $me['matricno'][0];?> : change your password</b></td>
       </tr>
       <tr>
	       <td class="right bold paint">old password</td>
           <td class="left"><input name="oldps" type="password" class="textMin" id="oldps" value="<?php echo $_POST['oldps']?>" /></td>
       </tr>
       <tr>
         <td class="right bold paint">new password</td>
         <td class="left"><input name="newps" type="password" class="textMin" id="newps" value="<?php echo $_POST['newps']?>" /></td>
       </tr>
       <tr>
         <td class="right bold paint">new password again</td>
         <td class="left"><input name="newps2" type="password" class="textMin" id="newps2" value="<?php echo $_POST['newps2']?>" /></td>
       </tr>
       <tr>
         <td class="right paint"></td>
         <td class="left"><input name="changepsw" type="submit" class="subMin" id="changepsw" value="change password" /></td>
       </tr>
     </table>
     <br />
   
   
     <p>&nbsp;</p>
   </div>
   <div id="quickMenu">
     <ul>
       <li class="center" style="background:#399; color:#FFF; font-weight:bold; border-top-left-radius:0;">Quick Menu</li>
       <li class="map">&nbsp;Home</li>
       <li class="mac"><a href="index.php?nxp=ap">Go to main menu</a></li>
       <li class="mbp">My Profiles</li>
       <li class="mbc"><a href="profile.php?nxp=bp">View My Profile </a></li>
       <li class="mbc"><a href="security.php?nxp=bp">Change Your Password</a></li>
       <li class="mcp">View Your Results</li>
       <li class="mcc"><a href="?nxp=cp">&nbsp;First Semester Result</a></li>
       <li class="mcc"><a href="?nxp=cp">Second Semester Result</a></li>
       <li class="mcc"><a href="?nxp=cp">All Sessional Result</a></li>
       <li><a href="logout.php">&nbsp;Logout</a></li>
     </ul>
   </div>
 </div>
 <div id="footer">
   <table width="80%" border="0" align="center" cellpadding="1" cellspacing="1">
     <tr>
       <td scope="row" id="idmg">&nbsp;</td>
     </tr>
   </table>
 </div>
 </form>
</body>
</html>