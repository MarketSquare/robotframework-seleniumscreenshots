requirements-python2.nix: requirements-python2.txt
	@nix-shell -p libffi \
	--run 'nix-shell setup.nix --argstr python python2 -A pip2nix \
	--run "pip2nix generate -r requirements-python2.txt --output=requirements-python2.nix"'

requirements-python3.nix: requirements-python3.txt
	@nix-shell -p libffi \
	--run 'nix-shell setup.nix --argstr python python3 -A pip2nix \
	--run "pip2nix generate -r requirements-python3.txt --output=requirements-python3.nix"'

.PHONY: freeze
freeze-python3:
	@grep "name" requirements-python3.nix |grep -Eo "\"(.*)\""|grep -Eo "[^\"]+"|sed -r "s|-([0-9\.]+)|==\1|g"

.PHONY: freeze
freeze-python2:
	@grep "name" requirements-python2.nix |grep -Eo "\"(.*)\""|grep -Eo "[^\"]+"|sed -r "s|-([0-9\.]+)|==\1|g"

.PHONY: upgrade
upgrade:
	@echo "Updating nixpkgs 18.09 revision"; \
	rev=$$(curl https://api.github.com/repos/NixOS/nixpkgs-channels/branches/nixos-18.09|jq -r .commit.sha); \
	echo "Updating nixpkgs $$rev hash"; \
	sha=$$(nix-prefetch-url --unpack https://github.com/NixOS/nixpkgs-channels/archive/$$rev.tar.gz); \
	sed -i "2s|.*|    url = \"https://github.com/NixOS/nixpkgs-channels/archive/$$rev.tar.gz\";|" setup.nix; \
	sed -i "3s|.*|    sha256 = \"$$sha\";|" setup.nix; \
	sed -i "2s|.*|    url = \"https://github.com/NixOS/nixpkgs-channels/archive/$$rev.tar.gz\";|" shell.nix; \
	sed -i "3s|.*|    sha256 = \"$$sha\";|" shell.nix;
	@echo "Updating setup.nix version"; \
	rev=$$(curl https://api.github.com/repos/datakurre/setup.nix/branches/master|jq -r ".commit.sha"); \
	echo "Updating setup.nix $$rev hash"; \
	sha=$$(nix-prefetch-url --unpack https://github.com/datakurre/setup.nix/archive/$$rev.tar.gz); \
	sed -i "6s|.*|    url = \"https://github.com/datakurre/setup.nix/archive/$$rev.tar.gz\";|" setup.nix; \
	sed -i "7s|.*|    sha256 = \"$$sha\";|" setup.nix
