# $NetBSD: rubyversion.mk,v 1.70 2011/12/28 16:40:06 taca Exp $
#

# This file determines which Ruby version is used as a dependency for
# a package.
#
#
# === User-settable variables ===
#
# RUBY_VERSION_DEFAULT
#	The preferered Ruby version to use.
#
#		Possible values: 18 192 193
#		Compatible values: 1.9(= 192) 19(= 192)
#		Default: 192
#
# RUBY_BUILD_RDOC
#	Build rdoc of this package and so that install formated
#	documentation.  It is also used in each package.
#
#		Possible values: Yes No
#		Default: Yes
#
# RUBY_BUILD_RI
#	Build ri format of this package so that ri command would be
#	display class/module definitions.  It is also used in each package.
#
#		Possible values: Yes No
#		Default: Yes
#
#
# === Package-settable variables ===
#
# RUBY_VERSION_SUPPORTED
#	The Ruby versions that are acceptable for the package.
#
#		Possible values: 18 192 193
#		Compatible values: 19 (= 192)
#		Default: 192
#
# RUBY_VERSION_REQD
#	The Ruby versions force to build (for pbulk).
#
# RUBY_NOVERSION
#	If "Yes", the package dosen't depend on any version of Ruby, such
#	as editing mode for emacs.  In this case, package's name would begin
#	with "ruby-".  Otherwise, the package's name is begin with
#	${RUBY_PKGPREFIX}; "ruby18", "ruby19" and "ruby193".
#
#		Possible values: Yes No
#		Default: No
#
# RUBY_DYNAMIC_DIRS
#	Build dynamic PLIST from directories.
#
#	Default: (empty)
#
# RUBY_ENCODING_ARG
#
#	Optional encoding argument for shbang line.
#
#	Default: (empty)
#
# === Defined variables ===
#
# RUBY_VER
#	Really selected version of ruby.  For compatibility, RUBY_VER
#	would not set to 192 but 19.
#
#		Possible values: 18 19 193
#
#	Use this variable in pkgsrc's Makefile
#
# RUBY_PKGPREFIX
#	Prefix part for ruby based packages.  It is recommended that to
#	use RUBY_PKGPREFIX with ruby related packages since you can supply
#	different binary packages as each version of Ruby.
#
# RUBY_ABI_VERSION
#	Ruby's ABI version.
#
# RUBY_DLEXT
#	Suffix of extention library.
#
# RUBY_SLEXT
#	Suffix of shared library.
#
# RUBY
#	Full path of ruby command.
#
# RDOC
#	Full path of rdoc command.
#
# RUBY_NAME
#	Name of ruby command.
#
# RUBYGEM_NAME
#	Name of gem command.
#
# RAKE_NAME
#	Name of rake command.
#
# RUBY_SUFFIX
#	Extra string for each ruby commands; ruby, irb and so on.
#
# RUBY_VERSION
#	Version of real Ruby's version excluding patchlevel.
#
# RUBY_VERSION_FULL
#	Version of Ruby including patchlevel.
#	
# RUBY_BASE
#	Name of ruby base package's name.
#
# RUBY_SRCDIR
#	Directory of base ruby package.
#
# RUBY_SHLIBVER
#	Suffix of libruby shared library's version.
#
# RUBY_SHLIB
#	String after libruby shared library.
#
# RUBY_SHLIBALIAS
#	Symblic link with libruby shared library with major version only.
#
# RUBY_STATICLIB
#	Name of libruby static library.
#
# RUBY_VER_DIR
#	Name of version directory under each library (and more) directories.
#
# RUBY_ARCH
#	Name of architecture-dependent directory name.
#
# RUBY_INC
#	machine independent include directory of ruby.
#
# RUBY_ARCHINC
#	machine dependent include directory of ruby.
#
# RUBY_LIB_BASE
#	common relative path of ruby's library.
#
# RUBY_LIB
#	version specific relative path of ruby's library.
#
# RUBY_ARCHLIB
#	version specific and machine dependent relative path of ruby's library.
#
# RUBY_SITELIB_BASE
#	common site local directory.
#
# RUBY_SITELIB
#	version specific site local directory.
#
# RUBY_SITEARCHLIB
#	version specific and machine dependent site local directory.
#
# RUBY_VENDORLIB_BASE
#	common vendor (pkgsrc) directory.
#
# RUBY_VENDORLIB
#	version specific vendor local directory.
#
# RUBY_VENDORARCHLIB
#	version specific and machine dependent vendor local directory.
#
# RUBY_DOC
#	version specific document direcotry.
#
# RUBY_EG
#	version specific examples direcotry.
#
# RUBY_GEM_BASE
#	common GEM directory.
#	
# GEM_HOME
#	version specific GEM directory.
#
# RUBY_RIDIR
#	common ri directory.
#
# RUBY_BASERIDIR
#	version specific ri directory.
#
# RUBY_SYSRIDIR
#	version specific system ri directory.
#
# RUBY_SITERIDIR
#	version specific site ri directory.
#
# Keywords: ruby
#

.if !defined(_RUBYVERSION_MK)
_RUBYVERSION_MK=	# defined

.include "../../mk/bsd.prefs.mk"

# current supported Ruby's version
RUBY18_VERSION=		1.8.7
RUBY19_VERSION=		1.9.2
RUBY193_VERSION=	1.9.3

# patch
RUBY18_PATCHLEVEL=	pl357
RUBY19_PATCHLEVEL=	pl290
RUBY193_PATCHLEVEL=	p0

# current API compatible version; used for version of shared library
RUBY18_API_VERSION=	1.8.7
RUBY19_API_VERSION=	1.9.1
RUBY193_API_VERSION=	1.9.1

#
RUBY_VERSION_DEFAULT?=	192

RUBY_VERSION_SUPPORTED?= 18 192 193
RUBY_VER?=		${RUBY_VERSION_DEFAULT}

# If package support only one version, use it.
.if ${RUBY_VERSION_SUPPORTED:[\#]} == 1
RUBY_VER=	${RUBY_VERSION_SUPPORTED}
.endif

.if defined(RUBY_VERSION_REQD)
. for rv in ${RUBY_VERSION_SUPPORTED}
.  if ${rv} == ${RUBY_VERSION_REQD}
RUBY_VER=	${rv}
.  endif
. endfor
.endif

.if ${RUBY_VER} == "192"
RUBY_VER=	19
.endif

.if ${RUBY_VER} == "18"
RUBY_VERSION=		${RUBY18_VERSION}
RUBY_VERSION_FULL=	${RUBY_VERSION}${RUBY_PATCHLEVEL:S/pl/./}
RUBY_ABI_VERSION=	${RUBY18_API_VERSION}
.elif ${RUBY_VER} == "19"
RUBY_VERSION=		${RUBY19_VERSION}
RUBY_VERSION_FULL=	${RUBY_VERSION}${RUBY_PATCHLEVEL}
RUBY_ABI_VERSION=	${RUBY19_API_VERSION}
.elif ${RUBY_VER} == "193"
RUBY_VERSION=		${RUBY193_VERSION}
RUBY_VERSION_FULL=	${RUBY_VERSION}${RUBY_PATCHLEVEL}
RUBY_ABI_VERSION=	${RUBY_VERSION}
.else
PKG_FAIL_REASON+= "Unknown Ruby version specified: ${RUBY_VER}."
.endif

RUBY_PATCHLEVEL=	${RUBY${RUBY_VER}_PATCHLEVEL}
RUBY_API_VERSION=	${RUBY${RUBY_VER}_API_VERSION}

# Variable assignment for multi-ruby packages
MULTI+=	RUBY_VER=${RUBY_VERS:U${RUBY_VERSION_DEFAULT}}

# RUBY_NOVERSION should be set to "Yes" if the package dosen't depend on
#	any specific version of ruby command.  In this case, package's
#	name begin with "ruby-".
#	If RUBY_NOVERSION is "No" (default), the package's name is begin
#	with ${RUBY_NAME}; "ruby18", "ruby19",  and so on.
#
#	It also affects to RUBY_DOC, RUBY_EG...
#
RUBY_NOVERSION?=	No

# _RUBY_VER_MAJOR, _RUBY_VER_MINOR, _RUBY_VER_TEENY and _RUBY_PATCHLEVEL
# is defined from version of Ruby.  It should not be used in packages'
# Makefile.
#
_RUBY_VER_MAJOR=	${RUBY_VERSION:C/([0-9]+)\.([0-9]+)\.([0-9]+)/\1/}
_RUBY_VER_MINOR=	${RUBY_VERSION:C/([0-9]+)\.([0-9]+)\.([0-9]+)/\2/}
_RUBY_VER_TEENY=	${RUBY_VERSION:C/([0-9]+)\.([0-9]+)\.([0-9]+)/\3/}

_RUBY_API_MAJOR=	${RUBY_API_VERSION:C/([0-9]+)\.([0-9]+)\.([0-9]+)/\1\2/}
_RUBY_API_MINOR=	${RUBY_API_VERSION:C/([0-9]+)\.([0-9]+)\.([0-9]+)/\3/}

RUBY_SUFFIX=		${RUBY_VER}

RUBY_NAME=		ruby${RUBY_SUFFIX}
RUBYGEM_NAME=		gem${RUBY_SUFFIX}
RAKE_NAME=		rake${RUBY_SUFFIX}

RUBY_ENCODING_ARG?=

RUBY_BASE=		ruby${RUBY_VER}-base

RUBY_PKGPREFIX?=	${RUBY_NAME}

.if ${RUBY_VER} == "18" || ${RUBY_VER} == "19"
RUBY_VER_DIR=		${_RUBY_VER_MAJOR}.${_RUBY_VER_MINOR}
.else
RUBY_VER_DIR=		${RUBY_VERSION}
.endif

.if empty(RUBY_NOVERSION:M[nN][oO])
RUBY_SUFFIX=
RUBY_NAME=		ruby
.endif

RUBY_BUILD_RDOC?=	Yes
RUBY_BUILD_RI?=		Yes

RUBY?=			${PREFIX}/bin/${RUBY_NAME}
RDOC?=			${PREFIX}/bin/rdoc${RUBY_VER}

RUBY_ARCH?= ${LOWER_ARCH}-${LOWER_OPSYS}${APPEND_ELF}${LOWER_OPSYS_VERSUFFIX}

#
# Ruby shared and static library version handling.
#
RUBY_SHLIBVER?=		${RUBY_API_VERSION}
RUBY_SHLIB?=		${RUBY_VER}.${RUBY_SLEXT}.${RUBY_SHLIBVER}
RUBY_SHLIBALIAS?=	@comment
RUBY_STATICLIB?=	${RUBY_VER}-static.a

.if ${OPSYS} == "NetBSD" || ${OPSYS} == "Interix"
RUBY_SHLIBVER=		${_RUBY_API_MAJOR}.${_RUBY_API_MINOR}
_RUBY_SHLIBALIAS=	${RUBY_VER}.${RUBY_SLEXT}.${_RUBY_API_MAJOR}
.elif ${OPSYS} == "FreeBSD" || ${OPSYS} == "DragonFly"
RUBY_SHLIBVER=		${RUBY_VER}
.elif ${OPSYS} == "OpenBSD"
RUBY_SHLIBVER=		${_RUBY_VER_MAJOR}.${_RUBY_VER_MINOR}${_RUBY_API_MINOR}
.elif ${OPSYS} == "Darwin"
RUBY_SHLIB=		${RUBY_VER}.${RUBY_SHLIBVER}.${RUBY_SLEXT}
.if ${RUBY_VER} == "18"
_RUBY_SHLIBALIAS=	${RUBY_VER}.${_RUBY_VER_MAJOR}.${_RUBY_VER_MINOR}.${RUBY_SLEXT}
.else
_RUBY_SHLIBALIAS=	.${_RUBY_VER_MAJOR}.${_RUBY_VER_MINOR}.${RUBY_SLEXT}
RUBY_STATICLIB=		${RUBY_VER}.${RUBY_API_VERSION}-static.a
.endif
.elif ${OPSYS} == "Linux"
_RUBY_SHLIBALIAS=	${RUBY_VER}.${RUBY_SLEXT}.${_RUBY_VER_MAJOR}.${_RUBY_VER_MINOR}
.elif ${OPSYS} == "SunOS"
RUBY_SHLIBVER=		${_RUBY_VER_MAJOR}
 _RUBY_SHLIBALIAS=	${RUBY_VER}.${RUBY_SLEXT}.${_RUBY_VER_MAJOR}.${_RUBY_VER_MINOR}.${_RUBY_API_MINOR}
.endif

.if !empty(_RUBY_SHLIBALIAS)
RUBY_SHLIBALIAS=	lib/libruby${_RUBY_SHLIBALIAS}
.endif

.if ${_OPSYS_SHLIB_TYPE} == "dylib"
RUBY_DLEXT=	bundle
RUBY_SLEXT=	dylib
.else
RUBY_DLEXT=	so
RUBY_SLEXT=	so
.endif

#
# Use pthread library with Ruby
#
.if !empty(MACHINE_PLATFORM:MDarwin-9.*-powerpc)
# Workaround for Ruby Bug #193
# http://redmine.ruby-lang.org/issues/show/193
RUBY_USE_PTHREAD?=	no
.else
RUBY_USE_PTHREAD?=	yes
PTHREAD_OPTS+=		native
PTHREAD_AUTO_VARS=	yes
.endif

RUBY_DYNAMIC_DIRS?=	# empty

RUBY_SRCDIR?=	${_PKGSRC_TOPDIR}/lang/${RUBY_BASE}

#
# common paths
#
RUBY_INC=		include/ruby-${RUBY_VER_DIR}
RUBY_ARCHINC=		${RUBY_INC}/${RUBY_ARCH}
RUBY_LIB_BASE=		lib/ruby
RUBY_LIB?=		${RUBY_LIB_BASE}/${RUBY_VER_DIR}
RUBY_ARCHLIB?=		${RUBY_LIB}/${RUBY_ARCH}
RUBY_SITELIB_BASE?=	${RUBY_LIB_BASE}/site_ruby
RUBY_SITELIB?=		${RUBY_SITELIB_BASE}/${RUBY_VER_DIR}
RUBY_SITEARCHLIB?=	${RUBY_SITELIB}/${RUBY_ARCH}
RUBY_VENDORLIB_BASE?=	${RUBY_LIB_BASE}/vendor_ruby
RUBY_VENDORLIB?=	${RUBY_VENDORLIB_BASE}/${RUBY_VER_DIR}
RUBY_VENDORARCHLIB?=	${RUBY_VENDORLIB}/${RUBY_ARCH}

RUBY_DOC?=		share/doc/${RUBY_NAME}
RUBY_EG?=		share/examples/${RUBY_NAME}


RUBY_GEM_BASE?=		${RUBY_LIB_BASE}/gems
GEM_HOME?=		${RUBY_GEM_BASE}/${RUBY_VER_DIR}

#
# ri database relative path
#
RUBY_RIDIR?=		share/ri
RUBY_BASERIDIR?=	${RUBY_RIDIR}/${RUBY_VER_DIR}
RUBY_SYSRIDIR?=		${RUBY_BASERIDIR}/system
RUBY_SITERIDIR?=	${RUBY_BASERIDIR}/site

#
# MAKE_ENV
#
MAKE_ENV+=		RUBY=${RUBY:Q} RUBY_VER=${RUBY_VER:Q} \
			RUBY_VERSION_DEFAULT=${RUBY_VERSION_DEFAULT:Q}

MAKEFLAGS+=		RUBY_VERSION_DEFAULT=${RUBY_VERSION_DEFAULT:Q}

#
# PLIST
#
PLIST_VARS+=		ruby18 ruby19 ruby192 ruby193
.if ${RUBY_VER} == "18"
PLIST.ruby18=		yes
.elif ${RUBY_VER} == "19"
PLIST.ruby19=		yes
PLIST.ruby192=		yes
.elif ${RUBY_VER} == "193"
PLIST.ruby19=		yes
PLIST.ruby193=		yes
.endif

PLIST_RUBY_DIRS=	RUBY_INC=${RUBY_INC:Q} RUBY_ARCHINC=${RUBY_ARCHINC:Q} \
			RUBY_LIB_BASE=${RUBY_LIB_BASE:Q} \
			RUBY_LIB=${RUBY_LIB:Q} \
			RUBY_ARCHLIB=${RUBY_ARCHLIB:Q} \
			RUBY_SITELIB_BASE=${RUBY_SITELIB_BASE:Q} \
			RUBY_SITELIB=${RUBY_SITELIB:Q} \
			RUBY_SITEARCHLIB=${RUBY_SITEARCHLIB:Q} \
			RUBY_VENDORLIB_BASE=${RUBY_VENDORLIB_BASE:Q} \
			RUBY_VENDORLIB=${RUBY_VENDORLIB:Q} \
			RUBY_VENDORARCHLIB=${RUBY_VENDORARCHLIB:Q} \
			RUBY_DOC=${RUBY_DOC:Q} \
			RUBY_EG=${RUBY_EG:Q} \
			RUBY_GEM_BASE=${RUBY_GEM_BASE:Q} \
			GEM_HOME=${GEM_HOME:Q} \
			RUBY_RIDIR=${RUBY_RIDIR:Q} \
			RUBY_BASERIDIR=${RUBY_BASERIDIR:Q} \
			RUBY_SYSRIDIR=${RUBY_SYSRIDIR:Q} \
			RUBY_SITERIDIR=${RUBY_SITERIDIR:Q}

#
# substitutions
#
FILES_SUBST+=		RUBY=${RUBY:Q} RUBY_NAME=${RUBY_NAME:Q} \
			RUBY_PKGPREFIX=${RUBY_PKGPREFIX:Q} \
			RUBY_VER=${RUBY_VER:Q} \
			${PLIST_RUBY_DIRS}

MESSAGE_SUBST+=		RUBY="${RUBY}" RUBY_VER="${RUBY_VER}" \
			RUBY_VERSION="${RUBY_VERSION}" \
			RUBY_PKGPREFIX="${RUBY_PKGPREFIX}" \
			${PLIST_RUBY_DIRS:S,DIR="${PREFIX}/,DIR=",}

PLIST_SUBST+=		RUBY=${RUBY:Q} RUBY_VER=${RUBY_VER:Q} \
			RUBY_PKGPREFIX=${RUBY_PKGPREFIX} \
			RUBY_VERSION=${RUBY_VERSION:Q} \
			RUBY_VER_DIR=${RUBY_VER_DIR:Q} \
			RUBY_DLEXT=${RUBY_DLEXT:Q} RUBY_SLEXT=${RUBY_SLEXT:Q} \
			RUBY_SHLIB=${RUBY_SHLIB:Q} \
			RUBY_SHLIBALIAS=${RUBY_SHLIBALIAS:Q} \
			RUBY_STATICLIB=${RUBY_STATICLIB:Q} \
			RUBY_ARCH=${RUBY_ARCH:Q} \
			${PLIST_RUBY_DIRS:S,DIR="${PREFIX}/,DIR=",}

#
# make dynamic PLIST
#
.if !empty(RUBY_DYNAMIC_DIRS)

RUBY_PLIST_DYNAMIC=	${WRKDIR}/PLIST.work

.if !defined(PLIST_SRC)
.  if exists(${PKGDIR}/PLIST.common)
PLIST_SRC+=		${PKGDIR}/PLIST.common
.  elif exists(${PKGDIR}/PLIST)
PLIST_SRC+=		${PKGDIR}/PLIST
.  endif

PLIST_SRC+=		${RUBY_PLIST_DYNAMIC}

.  if exists(${PKGDIR}/PLIST.common_end)
PLIST_SRC+=		${PKGDIR}/PLIST.common_end
.  endif

.endif

RUBY_PLIST_COMMENT_CMD= \
	${ECHO} "@comment The following lines are automatically generated"
RUBY_PLIST_FILES_CMD= ( cd ${DESTDIR}${PREFIX}; \
	${FIND} ${RUBY_DYNAMIC_DIRS} \( -type f -o -type l \) -print ) | \
	${SORT} -u
RUBY_GENERATE_PLIST =	( \
	${RUBY_PLIST_COMMENT_CMD}; \
	${RUBY_PLIST_FILES_CMD} ) > ${RUBY_PLIST_DYNAMIC}
.endif

.if !empty(RUBY_NOVERSION:M[nN][oO])
.if empty(RUBY_USE_PTHREAD:M[nN][oO])
.include "../../mk/pthread.buildlink3.mk"
.endif
.include "../../mk/bdb.buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/dlopen.buildlink3.mk"
.endif

PRINT_PLIST_AWK+=	/lib\/libruby${RUBY_STATICLIB}$$/ \
			{ sub(/${RUBY_STATICLIB}/, "$${RUBY_STATICLIB}"); }
PRINT_PLIST_AWK+=	/lib\/libruby${RUBY_VER}\.${RUBY_SLEXT}/ \
			{ sub(/${RUBY_VER}\.${RUBY_SLEXT}$$/, \
			"$${RUBY_VER}.$${RUBY_SLEXT}"); }
PRINT_PLIST_AWK+=	/${RUBY_SHLIB}$$/ \
			{ sub(/${RUBY_SHLIB}$$/, "$${RUBY_SHLIB}"); }
PRINT_PLIST_AWK+=	/${RUBY_SLEXT}\.${RUBY_SHLIBVER}$$/ \
			{ sub(/${RUBY_SLEXT}\.${RUBY_SHLIBVER}$$/, \
			"$${RUBY_SLEXT}.$${RUBY_SHLIBVER}"); }
.if ${RUBY_SHLIBALIAS} != "@comment"
PRINT_PLIST_AWK+=	/${RUBY_SHLIBALIAS:S/\//\\\//}$$/ \
			{ sub(/${RUBY_SHLIBALIAS:S/\//\\\//}$$/, \
			"$${RUBY_SHLIBALIAS}"); }
.endif
PRINT_PLIST_AWK+=	/^${RUBY_ARCHINC:S|/|\\/|g}/ \
			{ gsub(/${RUBY_ARCHINC:S|/|\\/|g}/, "$${RUBY_ARCHINC}"); \
			print; next; }
PRINT_PLIST_AWK+=	/^${RUBY_INC:S|/|\\/|g}/ \
			{ gsub(/${RUBY_INC:S|/|\\/|g}/, "$${RUBY_INC}"); \
			print; next; }
PRINT_PLIST_AWK+=	/\.${RUBY_DLEXT}$$/ \
			{ gsub(/${RUBY_DLEXT}$$/, "$${RUBY_DLEXT}") }
PRINT_PLIST_AWK+=	/^${RUBY_ARCHLIB:S|/|\\/|g}/ \
			{ gsub(/${RUBY_ARCHLIB:S|/|\\/|g}/, "$${RUBY_ARCHLIB}"); \
			print; next; }
PRINT_PLIST_AWK+=	/^${RUBY_VENDORARCHLIB:S|/|\\/|g}/ \
			{ gsub(/${RUBY_VENDORARCHLIB:S|/|\\/|g}/, "$${RUBY_VENDORARCHLIB}"); \
			print; next; }
PRINT_PLIST_AWK+=	/^${RUBY_VENDORLIB:S|/|\\/|g}/ \
			{ gsub(/${RUBY_VENDORLIB:S|/|\\/|g}/, "$${RUBY_VENDORLIB}"); \
			print; next; }
PRINT_PLIST_AWK+=	/^${RUBY_SITEARCHLIB:S|/|\\/|g}/ \
			{ gsub(/${RUBY_SITEARCHLIB:S|/|\\/|g}/, "$${RUBY_SITEARCHLIB}"); \
			print; next; }
PRINT_PLIST_AWK+=	/^${RUBY_SITELIB:S|/|\\/|g}/ \
			{ gsub(/${RUBY_SITELIB:S|/|\\/|g}/, "$${RUBY_SITELIB}"); \
			print; next; }
PRINT_PLIST_AWK+=	/^${RUBY_SITELIB_BASE:S|/|\\/|g}/ \
			{ gsub(/${RUBY_SITELIB_BASE:S|/|\\/|g}/, "$${RUBY_SITELIB_BASE}"); \
			print; next; }
PRINT_PLIST_AWK+=	/^${RUBY_VENDORLIB_BASE:S|/|\\/|g}/ \
			{ gsub(/${RUBY_VENDORLIB_BASE:S|/|\\/|g}/, "$${RUBY_VENDORLIB_BASE}"); \
			print; next; }
PRINT_PLIST_AWK+=	/^${RUBY_LIB:S|/|\\/|g}/ \
			{ gsub(/${RUBY_LIB:S|/|\\/|g}/, "$${RUBY_LIB}"); \
			print; next; }
PRINT_PLIST_AWK+=	/^${RUBY_DOC:S|/|\\/|g}/ \
			{ gsub(/${RUBY_DOC:S|/|\\/|g}/, "$${RUBY_DOC}"); \
			print; next; }
PRINT_PLIST_AWK+=	/^${RUBY_EG:S|/|\\/|g}/ \
			{ gsub(/${RUBY_EG:S|/|\\/|g}/, "$${RUBY_EG}"); \
			print; next; }
PRINT_PLIST_AWK+=	/^${RUBY_SITERIDIR:S|/|\\/|g}/ \
			{ gsub(/${RUBY_SITERIDIR:S|/|\\/|g}/, "$${RUBY_SITERIDIR}"); \
			print; next; }
PRINT_PLIST_AWK+=	/^${RUBY_SYSRIDIR:S|/|\\/|g}\// \
			{ next; }
PRINT_PLIST_AWK+=	/\/${RUBY_NAME}/ \
			{ sub(/${RUBY_NAME}/, "$${RUBY_NAME}"); }
PRINT_PLIST_AWK+=	/^${GEM_HOME:S|/|\\/|g:S|.|\\.|g}/ \
			{ gsub(/${GEM_HOME:S|/|\\/|g}/, "$${GEM_HOME}"); }

.endif # _RUBY_MK
