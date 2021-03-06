# $NetBSD: buildlink3.mk,v 1.3 2011/12/03 09:12:03 sbd Exp $
#

BUILDLINK_TREE+=	gdbm_compat

.if !defined(GDBM_COMPAT_BUILDLINK3_MK)
GDBM_COMPAT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gdbm_compat+=	gdbm_compat>=1.8.3
BUILDLINK_ABI_DEPENDS.gdbm_compat+=	gdbm_compat>=1.9.1
BUILDLINK_PKGSRCDIR.gdbm_compat?=	../../databases/gdbm_compat

# Look like real ndbm.
BUILDLINK_TRANSFORM+=	l:ndbm:gdbm_compat:gdbm

.include "../../databases/gdbm/buildlink3.mk"
.endif	# GDBM_COMPAT_BUILDLINK3_MK

BUILDLINK_TREE+=	-gdbm_compat
