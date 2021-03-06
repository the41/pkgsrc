# $NetBSD: xpi.mk,v 1.1 2010/04/22 17:06:19 tnn Exp $
#
# common logic for repackaging mozilla extensions (.xpi files)
# Used by the {firefox,seamonkey,thunderbird}-l10n packages.

USE_TOOLS+=	unzip pax

post-extract: extract-xpi

.PHONY: extract-xpi
extract-xpi:
.for f in ${XPI_FILES}
	@${MKDIR} ${WRKDIR}/${f:S/.xpi//} && cd ${WRKDIR}/${f:S/.xpi//} && ${UNZIP_CMD} -aqo "${WRKDIR}/${f}"
.endfor

do-install: install-xpi

.PHONY: install-xpi
install-xpi:
.for f in ${XPI_FILES}
	id=$$(${AWK} '/em:id=/ {sub("^.*em:id=\"", "");sub("\".*$$","");print $$0}' < ${WRKDIR}/${f:S/.xpi//}/install.rdf);	\
	  cd ${WRKDIR}/${f:S/.xpi//} &&		\
	  pax -rw . ${DESTDIR}${EXTENSIONS_DIR}/$${id}
.endfor
