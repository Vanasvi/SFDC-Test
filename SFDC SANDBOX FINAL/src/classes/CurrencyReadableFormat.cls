public class CurrencyReadableFormat
{
    public static string convertToReadableFormat(decimal d)
    {
        List<String> args = new String[]{'0','number','###,###,##0.00'};
        String s = String.format(d.format(), args);
        string l=s.replaceAll(',','');
        s='$'+s+' ('+(l.length())+')';
        System.debug(s);
        return s;
    }
}