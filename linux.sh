## PATCH
# single file
diff -uN from-file to-file >to-file.patch
patch -p0 < to-file.patch
patch -RE -p0 < to-file.patch
# directory
diff -uNr  from-docu  to-docu  >to-docu.patch
cd to-docu
patch -p1 < to-docu.patch
patch -R -p1 <to-docu.patch
