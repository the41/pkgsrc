$NetBSD: patch-ipc_chromium_src_build_build__config.h,v 1.2 2011/08/19 10:10:01 tnn Exp $

--- mozilla/ipc/chromium/src/build/build_config.h.orig	2011-08-11 21:41:01.000000000 +0000
+++ mozilla/ipc/chromium/src/build/build_config.h
@@ -19,6 +19,10 @@
 #define OS_MACOSX 1
 #elif defined(__linux__) || defined(ANDROID)
 #define OS_LINUX 1
+#elif defined(__NetBSD__)
+#define OS_NETBSD 1
+#elif defined(__DragonFly__)
+#define OS_DRAGONFLY 1
 #elif defined(_WIN32)
 #define OS_WIN 1
 #else
@@ -27,7 +31,7 @@
 
 // For access to standard POSIX features, use OS_POSIX instead of a more
 // specific macro.
-#if defined(OS_MACOSX) || defined(OS_LINUX)
+#if defined(OS_MACOSX) || defined(OS_LINUX) || defined(OS_NETBSD) || defined(OS_DRAGONFLY)
 #define OS_POSIX 1
 #endif
 
@@ -60,6 +64,9 @@
 #elif defined(__ppc__) || defined(__powerpc__)
 #define ARCH_CPU_PPC 1
 #define ARCH_CPU_32_BITS 1
+#elif defined(__sparc64__)
+#define ARCH_CPU_SPARC 1
+#define ARCH_CPU_64_BITS 1
 #else
 #error Please add support for your architecture in build/build_config.h
 #endif
