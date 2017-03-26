package com.lww.common;

import java.util.Random;


public abstract class Column  {

    public final String name;

    public Column(String name) {
        this.name = name;
    }

    abstract public Object getValue(long pk);

    public static Column of(String column) {
        String[] secs = column.split(":");
        switch (secs[1]) {
            case "float":
                return new FloatColumn(secs[0], secs[2]);
            case "int":
                return new IntColumn(secs[0], secs[2]);
            case "str":
                return new StrColumn(secs[0], secs[2]);
            default:
                return new PkColumn(secs[0]);
        }
    }

    public static class PkColumn extends Column {
        public PkColumn(String column) {
            super(column);
        }

        @Override
        public Object getValue(long pk) {
            return pk;
        }
    }

    public static class FloatColumn extends Column {
        private static Random RAND = new Random();

        private double constValue;
        private boolean random;
        private double randStart;
        private double randEnd;

        public FloatColumn(String name, String param) {
            super(name);
            if (param.startsWith("r")) {
                random = true;
                String[] secs = param.substring(1).split("~");
                randStart = Double.parseDouble(secs[0]);
                randEnd = Double.parseDouble(secs[1]);
            } else {
                random = false;
                constValue = Double.parseDouble(param.substring(1));
            }
        }

        @Override
        public Double getValue(long pk) {
            if (random)
                return RAND.nextDouble() * (randEnd - randStart) + randStart;
            return constValue;
        }
    }

    public static class IntColumn extends Column {
        private static Random RAND = new Random();

        private int constValue;
        private boolean random;
        private int randStart;
        private int randEnd;

        public IntColumn(String name, String param) {
            super(name);
            if (param.startsWith("r")) {
                random = true;
                String[] secs = param.substring(1).split("~");
                randStart = Integer.parseInt(secs[0]);
                randEnd = Integer.parseInt(secs[1]);
            } else {
                random = false;
                constValue = Integer.parseInt(param.substring(1));
            }
        }

        @Override
        public Object getValue(long pk) {
            if (random)
                return Math.abs(RAND.nextInt()) % (randEnd - randStart + 1) + randStart;
            return constValue;
        }
    }


    public static class StrColumn extends Column {
        private static Random RAND = new Random();

        private String constValue;
        private boolean random;
        private int randLen;

        public StrColumn(String name, String param) {
            super(name);
            if (param.startsWith("r")) {
                random = true;
                randLen = Integer.parseInt(param.substring(1));
            } else {
                random = false;
                constValue = param.substring(1);
            }
        }

        @Override
        public String getValue(long pk) {
            if (random) {
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < randLen; ++i) {
                    int x = Math.abs(RAND.nextInt()) % 52;
                    if (x < 26)
                        builder.append((char)(x + (int)('A')));
                    else
                        builder.append((char)(x - 26 + (int)('a')));
                }
                return builder.toString();
            }
            return constValue;
        }
    }

}
