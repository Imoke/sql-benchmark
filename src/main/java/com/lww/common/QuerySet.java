package com.lww.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;


public class QuerySet {

    private List<Query> queries;

    private static List<Integer>[] parse(String pattern) {
        String[] secs = pattern.split(":");
        List<Integer>[] r = new List[secs.length];
        for (int i = 0; i < secs.length; ++i) {
            r[i] = null;
            if (!secs[i].equals("*")) {
                // 语法: [<start>-<end>|<index>][,[<start>-<end>|<index>]]*
                // 样例: 1-3,5,7-10
                r[i] = new ArrayList<>();
                for (String os : secs[i].split(",")) {
                    String s[] = os.split("-");
                    int ss = Integer.parseInt(s[0]);
                    int se = s.length > 1 ? Integer.parseInt(s[1]) : ss;
                    for (int si = ss - 1; si <= se - 1; ++si)
                        r[i].add(si);
                }
            }
        }
        return r;
    }

    private static String[] loadSections(Properties p, String prefix) {
        List<String> res = new ArrayList<>();
        for (int index = 0; ; ++index) {
            String section = p.getProperty(prefix + ".items." + (index + 1));
            if (section == null)
                break;
            res.add(section);
        }
        return res.toArray(new String[0]);
    }

    public static void append(List<Integer>[] pattern, List<String[]> sections, List<Query> queries,
                              String[] pis, String prefix, int pi) {
        if (pi >= pattern.length) {
            queries.add(new Query(String.join("-", pis), prefix));
            return;
        }
        String[] secs = sections.get(pi);
        if (pattern[pi] == null) {
            for (int si = 0; si < secs.length; ++si) {
                pis[pi] = String.valueOf(si + 1);
                append(pattern, sections, queries, pis, prefix + " " + secs[si], pi + 1);
            }
        } else {
            for (Integer si : pattern[pi]) {
                pis[pi] = String.valueOf(si + 1);
                append(pattern, sections, queries, pis, prefix + " " + secs[si], pi + 1);
            }
        }
    }

    public QuerySet(Properties p, String prefix) {
        queries = new ArrayList<>();
        List<String[]> sections = new ArrayList<>();
        for (String pattern : p.getProperty(prefix + ".all").split("\\|")) {
            List<Integer>[] pt = parse(pattern);
            for (int i = sections.size(); i < pt.length; ++i)
                sections.add(loadSections(p, prefix + ".section." + (i + 1)));
            append(pt, sections, queries, new String[pt.length], "", 0);
        }
    }

    public List<Query> getQueries() {
        return queries;
    }
}
