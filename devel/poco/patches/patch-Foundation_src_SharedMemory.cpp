$NetBSD$

--- Foundation/src/SharedMemory.cpp.orig	2011-10-20 06:59:15.850534958 +0000
+++ Foundation/src/SharedMemory.cpp
@@ -36,7 +36,7 @@
 
 #if defined(__sun)
 #undef _XOPEN_SOURCE
-#define _XOPEN_SOURCE 500
+#define _XOPEN_SOURCE 600
 #endif
 
 
