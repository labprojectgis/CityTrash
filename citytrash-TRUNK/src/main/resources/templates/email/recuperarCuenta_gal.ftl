<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>${nombre}</title>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            font-size: 48px;
        }
    </style>
</head>
<body style="margin: 0; padding: 0;">

    <table align="center" border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;">
        <tr>
            <td align="center" bgcolor="#16A085" style="padding: 40px 0 30px 0;">               
                <p style="color:#F7F9F9";> Ola ${nombre} ${apellidos}! </p>                
            </td>
        </tr>
        <tr>
            <td bgcolor="#eaeaea" style="padding: 40px 30px 40px 30px;">
             <p>
			Recibimos a solicitude para recuperar a túa conta de ${email} desde CityTrash. Se non solicitou, non acceda á seguinte ligazón <a href="${recuperar_url}"> ${recuperar_url} </a> e ignora a mensaxe. 
			</p>
			
			<p> Lembre que debes recuperar a túa conta antes ${fechaExpiracion} </p> 
			                                         
            </td>
        </tr>
        <tr>
            <td bgcolor="#777777" style="padding: 30px 30px 30px 30px;">
                <p> Thanks, </p>
                <p style="color:#F7F9F9";>${firma}</p>               
            </td>
        </tr>
    </table>

</body>
</html>



