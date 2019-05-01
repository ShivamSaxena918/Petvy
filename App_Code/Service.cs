using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.NetworkInformation;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for Service
/// </summary>
public class Service
{
    public Service()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static string Encryptdata(string password)
    {
        string strmsg = string.Empty;
        byte[] encode = new byte[password.Length];
        encode = Encoding.UTF8.GetBytes(password);

        strmsg = Convert.ToBase64String(encode);

        return strmsg;
    }

    public static string Decryptdata(string encryptpwd)
    {
        string decryptpwd = string.Empty;
        UTF8Encoding encodepwd = new UTF8Encoding();
        Decoder Decode = encodepwd.GetDecoder();
        byte[] todecode_byte = Convert.FromBase64String(encryptpwd);
        int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
        char[] decoded_char = new char[charCount];
        Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
        decryptpwd = new String(decoded_char);
        return decryptpwd;
    }
    public static void SendEmail(string email, string subject, string msgbody)
    {
        MailMessage Msg = new MailMessage("FromEmail", email);
        Msg.Subject = subject;
        Msg.Body = msgbody;
        Msg.IsBodyHtml = true;

        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.UseDefaultCredentials = false;
        smtp.EnableSsl = true;
        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

        NetworkCredential MyCredentials = new NetworkCredential("yourEmail", "yourPassword");
        smtp.Credentials = MyCredentials;
        smtp.Send(Msg);

    }
    public static string GetMacAddress()
    {
        foreach (NetworkInterface nic in NetworkInterface.GetAllNetworkInterfaces())
        {
            // Only consider Ethernet network interfaces
            if (nic.NetworkInterfaceType == NetworkInterfaceType.Ethernet &&
                nic.OperationalStatus == OperationalStatus.Up)
            {
                return nic.GetPhysicalAddress().ToString();
            }
        }
        return null;
    }
    public static string UniqueCode()
    {
        string vc;
        DateTime now = DateTime.Now;
        vc = now.ToString();
        vc = vc.GetHashCode().ToString().Trim('-');
        return vc;
    }
}