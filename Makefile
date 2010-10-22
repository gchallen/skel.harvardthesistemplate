# 10 Jul 2010 : GWA : Makefile for the whole bloody thing.

TARGET = thesis

# 10 Jul 2010 : GWA : Add subdirs here as needed. They will be built into the
# 						  complete document in order. Probably best to have each
# 						  correspond to a chapter in the thesis, but that's not
# 						  strictly required.

SUBDIRS = 0-frontmatter 1-chapter

# 10 Jul 2010 : GWA : Leave this empty.

INSTALLDIR = ""
include Makerules

# 10 Jul 2010 : GWA : Change this to point to where you want your thesis
# 							installed if you're pushing it to a webshare.

install:: dsp noxxxnote missing-fail embed
	scp $(PDF) username@host:/path/to/thesis/directory/$(INSTALLDIR)/$(PDF)

# 10 Jul 2010 : GWA : Helpers that only make sense at the top level.

allmake: all
	for i in $(SUBDIRS); do $(MAKE) -C $$i --no-print-directory all; done

allclean: clean
	for i in $(SUBDIRS); do $(MAKE) -C $$i --no-print-directory clean; done

allpages: pages
	for i in $(SUBDIRS); do $(MAKE) -C $$i --no-print-directory pages; done

allinstall: install
	for i in $(SUBDIRS); do $(MAKE) -C $$i --no-print-directory install; done

FORCE:
