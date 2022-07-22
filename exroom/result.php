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
if(isset($_REQUEST['sm'])){

	$semes = $con->clean($_REQUEST['sm']);
	 switch($semes){
		
		case crypt("1","rSexam"):
		$sem = " 1st "; $batch = 1;
		break; 
		case crypt("2","rSexam"):
		$sem = " 2nd "; $batch = 2;
		break;
		   	  	 
	}
	
	$mYears = $con->getFields($con->selectDistinct("year","student_result",array("matricno"=>$_SESSION['exmUser'])),array("year"));
 	
}
///////////////////////
				
	$_SESSION['yres'] = $_POST['yres'];				
				
			
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
<body class="">
 <form method="post">
 <input type="hidden" name="nxp" id="nxp" value="<?php echo $_REQUEST['nxp']; ?>"  />
 <input type="hidden" name="semes" id="semes" value="<?php echo $_REQUEST['sm']; ?>"  />
  <input type="hidden" name="loadErr" id="loadErr" value="<?php print $msg;?>"/> 
 
 <div id="window"> electronic examination system <br />
<label class="headlab"> ...because examination matters</label></div>
 <div id="bodyTag">
   <div id="banner"></div>
   <div id="redlight"> <marquee behavior="alternate" direction="left" scrollamount="2"> welcome <?php echo $me['surname'][0].', '.$me['firstname'][0];?>.</marquee> </div>
   <div id="adminMenu"></div>
   <div id="quickMenu">
     <ul>
       <li class="center" style="background:#399; color:#FFF; font-weight:bold; border-top-left-radius:0;">Quick Menu</li>
       <li class="map">&nbsp;Home</li>
       <li class="mac"><a href="index.php?nxp=ap">Go to main menu</a></li>
       <li class="mbp">My Profiles</li>
       <li class="mbc"><a href="profile.php?nxp=bp">View My Profile </a></li>
       <li class="mdp">Course Registration</li>
       <li class="mdc"><a href="coursereg.php?nxp=dp">Register Now</a></li>
       
       <li class="mcp">View Your Results</li>
       <li class="mcc"><a href="result.php?nxp=cp&amp;sm=<?php echo crypt("1","rSexam")?>">&nbsp;First Semester Result</a></li>
       <li class="mcc"><a href="result.php?nxp=cp&amp;sm=<?php echo crypt("2","rSexam")?>">Second Semester Result</a></li>
       <li><a href="logout.php">&nbsp;Logout</a></li>
     </ul>
   </div>
   <div id="adminBody">
     <table width="96%" border="0" align="center" cellpadding="1" cellspacing="1" class="blueBorder small">
       <?php echo $psMsg; ?>
       
        <tr>
         <td class="right paint" scope="row">&nbsp;</td>
         <td class="left over"><b><?php echo $me['matricno'][0];?> : <?php echo $sem;?> semester result</b></td>
       </tr>
       <tr>
	       <td class="right bold paint">select session</td>
           <td class="left"><select name="yres" class="medium" id="yres">
           <option value="">...</option>
           <?php foreach($mYears['year'] as $k=>$ys){ ?>
           <option value="<?php echo $ys;?>"<?php echo ($_SESSION['yres']==$_POST['yres'])?"selected":""?>><?php echo $ys;?></option>
           <?php  } ?>
       </select> &nbsp;
       <input name="checkres" type="submit" class="subMin" id="checkres" value=" Go " /></td>
       </tr>
      </table>
     <br />
  		<?php $allRes = $con->getFields($con->selectAnd("student_result",array("matricno"=>$_SESSION['exmUser'],"batchno"=>$batch,"year"=>$_SESSION['yres'])),array("subjectcode","unit","status","testscore","examscore","totaltest","totalexam","totalmark","totalscore","point","grade")); 
		/// when no entry exist 
		if(isset($_POST['checkres']))
		if(count($allRes['subjectcode'])==0){  
		?> 
        
      <table width="96%" align="center" class="blueBorder">
         <tr>
    	  <td colspan="10" class="center err"> No Registered Courses..</td>
    	 </tr>
         </table>
      <?php } // end when no entry exist 
	  
	  else { // show all result has 
	  	$c = 0; 
		
		?>
		 <table width="98%" align="center" class="blueBorder regTag small">
       
		<tr class="bold ok">
        	<th>S/N</th>
        	<th> course</th>
        	<th> name</th>
        	<th>Unit</th>
        	<th>status</th>
        	<th>Test</th>
        	<th>Score</th>
        	<th>Exam</th>
        	<th>Score</th>
        	<th>Total</th>
        	<th>Score</th>
        	<th>point</th>
            <th>grade</th>
            
        </tr>
    	
	<?php	foreach($allRes['subjectcode'] as $k=>$v){
	  ?>
      
    	<tr style="text-transform:uppercase;" class="lines">
    	  <td>&nbsp;<?php echo $c+1; ?></td>
    	  <td class="center">&nbsp;<?php echo $allRes['subjectcode'][$c]; ?></td>
    	  <td class="left">&nbsp;<?php 	$subName = $con->getFields($con->selectAnd('subject',array('code'=>$allRes['subjectcode'][$c])),array("name")); echo $subName['name'][0]?></td>
    	  <td class="center"><?php echo $allRes['unit'][$c]; ?></td>
    	  <td class="center"><?php echo $allRes['status'][$c]; ?></td>
    	  <td class="center"><?php echo $allRes['totaltest'][$c]; ?></td>
    	  <td class="center"><?php echo $allRes['testscore'][$c]; ?></td>
    	  <td class="center"><?php echo $allRes['totalexam'][$c]; ?></td>
    	  <td class="center"><?php echo $allRes['examscore'][$c]; ?></td>
    	  <td class="center"><?php echo $allRes['totalmark'][$c]; ?></td>
    	  <td class="center"><?php echo $allRes['totalscore'][$c]; ?></td>
    	  <td class="center"><?php echo $allRes['point'][$c] ?></td>
          <td class="center"><?php echo $allRes['grade'][$c]; ?></td>
  	  </tr>
      <?php $c++; }
			  
	  }?>
    	 
   	  </table>
   
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