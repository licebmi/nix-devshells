final: prev:

{
  perlPackages = prev.perlPackages // (with prev.perlPackages;
    with final.perlPackages; {

      AWSSignature4 = buildPerlModule {
        pname = "AWS-Signature4";
        version = "1.02";
        src = prev.fetchurl {
          url = "mirror://cpan/authors/id/L/LD/LDS/AWS-Signature4-1.02.tar.gz";
          sha256 =
            "20bbc16cb3454fe5e8cf34fe61f1a91fe26c3f17e449ff665fcbbb92ab443ebd";
        };
        propagatedBuildInputs = [ LWP TimeDate URI ];
        meta = {
          description = "Create a version4 signature for Amazon Web Services";
          license = with prev.lib.licenses; [ artistic1 gpl1Plus ];
        };
      };

      DistZillaPluginMakeMakerAwesome = buildPerlPackage {
        pname = "Dist-Zilla-Plugin-MakeMaker-Awesome";
        version = "0.49";
        src = prev.fetchurl {
          url =
            "mirror://cpan/authors/id/E/ET/ETHER/Dist-Zilla-Plugin-MakeMaker-Awesome-0.49.tar.gz";
          sha256 =
            "1ff46df84886fcb9d00f53fe300d74bc7bac7b92023597e651c436d1824c030e";
        };
        buildInputs =
          [ CPANMetaCheck Filepushd ModuleBuildTiny TestDeep TestFatal ];
        propagatedBuildInputs =
          [ DistZilla Moose PathTiny TypeTiny namespaceautoclean ];
        meta = {
          homepage =
            "https://github.com/avar/dist-zilla-plugin-makemaker-awesome";
          description = "A more awesome MakeMaker plugin for L<Dist::Zilla>";
          license = with prev.lib.licenses; [ artistic1 gpl1Plus ];
        };
      };

      DistZillaPluginMetaProvides = buildPerlPackage {
        pname = "Dist-Zilla-Plugin-MetaProvides";
        version = "2.002004";
        src = prev.fetchurl {
          url =
            "mirror://cpan/authors/id/K/KE/KENTNL/Dist-Zilla-Plugin-MetaProvides-2.002004.tar.gz";
          sha256 =
            "fc28142da9a44c3d0b4a819e422b654fb2c700c1e657d15b53aad39f22d07717";
        };
        buildInputs = [ PathTiny TestFatal ];
        propagatedBuildInputs = [
          TestDeep
          DistZilla
          HashMergeSimple
          Moose
          MooseXTypes
          namespaceautoclean
        ];
        meta = {
          homepage = "https://github.com/kentnl/Dist-Zilla-Plugin-MetaProvides";
          description = "Generating and Populating 'provides' in your META.yml";
          license = with prev.lib.licenses; [ artistic1 gpl1Plus ];
        };
      };

      DistZillaPluginMetaProvidesPackage = buildPerlPackage {
        pname = "Dist-Zilla-Plugin-MetaProvides-Package";
        version = "2.004003";
        src = prev.fetchurl {
          url =
            "mirror://cpan/authors/id/K/KE/KENTNL/Dist-Zilla-Plugin-MetaProvides-Package-2.004003.tar.gz";
          sha256 =
            "80bb21fd18aea9f5203674a8294e33221d39d37354b1791da237ff0911398585";
        };
        buildInputs = [ PathTiny TestFatal ];
        propagatedBuildInputs = [
          DataDump
          DistZilla
          DistZillaPluginMetaProvides
          DistZillaRoleModuleMetadata
          Moose
          MooseXLazyRequire
          MooseXTypes
          PPI
          SafeIsa
          namespaceautoclean
        ];
        meta = {
          homepage =
            "https://github.com/kentnl/Dist-Zilla-Plugin-MetaProvides-Package";
          description =
            "Extract namespaces/version from traditional packages for provides";
          license = with prev.lib.licenses; [ artistic1 gpl1Plus ];
        };
      };

      DistZillaPluginOSPrereqs = buildPerlPackage {
        pname = "Dist-Zilla-Plugin-OSPrereqs";
        version = "0.011";
        src = prev.fetchurl {
          url =
            "mirror://cpan/authors/id/D/DA/DAGOLDEN/Dist-Zilla-Plugin-OSPrereqs-0.011.tar.gz";
          sha256 =
            "06026cfd82c3f4fd9a5b75ae256a148d35ff5b977aabaf12cfcc6d73d823298f";
        };
        buildInputs = [ TestFatal TestDeep ];
        propagatedBuildInputs = [ DistZilla Moose namespaceautoclean ];
        meta = {
          homepage = "https://github.com/dagolden/Dist-Zilla-Plugin-OSPrereqs";
          description = "List prereqs conditional on operating system";
          license = prev.lib.licenses.asl20;
        };
      };

      DistZillaPluginOurPkgVersion = buildPerlPackage {
        pname = "Dist-Zilla-Plugin-OurPkgVersion";
        version = "0.21";
        src = prev.fetchurl {
          url =
            "mirror://cpan/authors/id/P/PL/PLICEASE/Dist-Zilla-Plugin-OurPkgVersion-0.21.tar.gz";
          sha256 =
            "76e3861f03f0ad87432089530349478f33dd07b56df650f8b971153c2e42d021";
        };
        buildInputs = [ TestDeep PathTiny TestException TestVersion ];
        propagatedBuildInputs =
          [ DistZilla Moose MooseXTypesPerl PPI namespaceautoclean ];
        meta = {
          homepage =
            "https://metacpan.org/dist/Dist-Zilla-Plugin-OurPkgVersion";
          description = "No line insertion and does Package version with our";
          license = prev.lib.licenses.artistic2;
        };
      };

      DistZillaRoleModuleMetadata = buildPerlPackage {
        pname = "Dist-Zilla-Role-ModuleMetadata";
        version = "0.006";
        src = prev.fetchurl {
          url =
            "mirror://cpan/authors/id/E/ET/ETHER/Dist-Zilla-Role-ModuleMetadata-0.006.tar.gz";
          sha256 =
            "5e211cbde5057b87f8e34061b662de4cee50373eb50ed5ecf2583e70a22ba21e";
        };
        buildInputs =
          [ DistZilla ModuleBuildTiny PathTiny TestDeep TestFatal TestNeeds ];
        propagatedBuildInputs = [ Moose namespaceautoclean ];
        meta = {
          homepage =
            "https://github.com/karenetheridge/Dist-Zilla-Role-ModuleMetadata";
          description = "A role for plugins that use Module::Metadata";
          license = with prev.lib.licenses; [ artistic1 gpl1Plus ];
        };
      };

      LogAnyAdapterCallback = buildPerlPackage {
        pname = "Log-Any-Adapter-Callback";
        version = "0.101";
        src = prev.fetchurl {
          url =
            "mirror://cpan/authors/id/P/PE/PERLANCAR/Log-Any-Adapter-Callback-0.101.tar.gz";
          sha256 =
            "d008075a2ceb57bb7e96d5e63b8ce8ec5b987fc9f224b460cba7eff73b954a16";
        };
        propagatedBuildInputs = [ LogAny ];
        meta = {
          homepage = "https://metacpan.org/release/Log-Any-Adapter-Callback";
          description = "(DEPRECATED) Send Log::Any logs to a subroutine";
          license = with prev.lib.licenses; [ artistic1 gpl1Plus ];
        };
      };

      NetCIDRLite = buildPerlPackage {
        pname = "Net-CIDR-Lite";
        version = "0.22";
        src = prev.fetchurl {
          url =
            "mirror://cpan/authors/id/S/ST/STIGTSP/Net-CIDR-Lite-0.22.tar.gz";
          sha256 =
            "4317d8cb341a617b9e0888da43c09cdffffcb0c9edf7b8c9928d742a563b8517";
        };
        meta = {
          description =
            "Perl extension for merging IPv4 or IPv6 CIDR addresses";
        };
      };

      SearchElasticsearch = buildPerlPackage {
        pname = "Search-Elasticsearch";
        version = "7.715";
        src = prev.fetchurl {
          url =
            "mirror://cpan/authors/id/E/EZ/EZIMUEL/Search-Elasticsearch-7.715.tar.gz";
          sha256 =
            "9001085e9ad681d8e696f9196f663464691c8b34b1f305bdb66d6ab5302c2947";
        };
        buildInputs = [
          IOSocketSSL
          LogAnyAdapterCallback
          TestDeep
          TestException
          TestPod
          TestSharedFork
        ];
        propagatedBuildInputs = [
          AnyURIEscape
          DevelGlobalDestruction
          HTTPMessage
          JSONMaybeXS
          LWP
          LogAny
          ModuleRuntime
          Moo
          NetIP
          PackageStash
          SubExporter
          TryTiny
          URI
          namespaceclean
        ];
        meta = {
          homepage = "https://metacpan.org/pod/Search::Elasticsearch";
          description = "The official client for Elasticsearch";
          license = prev.lib.licenses.asl20;
        };
      };

      SearchElasticsearchClient2_0 = buildPerlPackage {
        pname = "Search-Elasticsearch-Client-2_0";
        version = "6.81";
        src = prev.fetchurl {
          url =
            "mirror://cpan/authors/id/E/EZ/EZIMUEL/Search-Elasticsearch-Client-2_0-6.81.tar.gz";
          sha256 =
            "73400b286fea3b889843263120cd021a21ab584d46261889c36afa1831fd84df";
        };
        buildInputs = [
          IOSocketSSL
          LogAny
          LogAnyAdapterCallback
          SubExporter
          TestDeep
          TestException
        ];
        propagatedBuildInputs = [
          DevelGlobalDestruction
          Moo
          SearchElasticsearch
          TryTiny
          namespaceclean
        ];
        meta = {
          homepage = "https://metacpan.org/pod/Search::Elasticsearch";
          description =
            "Thin client with full support for Elasticsearch 2.x APIs";
          license = prev.lib.licenses.asl20;
        };
      };

      URLEncode = buildPerlPackage {
        pname = "URL-Encode";
        version = "0.03";
        src = prev.fetchurl {
          url = "mirror://cpan/authors/id/C/CH/CHANSEN/URL-Encode-0.03.tar.gz";
          sha256 =
            "7295d7f07796b179131d9c0f230a6effa56d204de2f8dc72f2e09c61458c8ee6";
        };
        meta = {
          description =
            "Encoding and decoding of C<application/x-www-form-urlencoded> encoding";
          license = with prev.lib.licenses; [ artistic1 gpl1Plus ];
        };
      };

      ZabbixTiny = buildPerlModule {
        pname = "Zabbix-Tiny";
        version = "1.11";
        src = prev.fetchurl {
          url =
            "mirror://cpan/authors/id/W/WH/WHOSGONNA/Zabbix-Tiny-1.11.tar.gz";
          sha256 =
            "14c1eb47e0fb9052efd8fe7d1d1af7f812963b864c21472c38f65240d4cf4bce";
        };
        doCheck = false;
        buildInputs = [ ModuleBuildTiny ];
        propagatedBuildInputs = [ JSON LWP LWPProtocolhttps Moo ];
        meta = {
          homepage = "https://github.com/whosgonna/Zabbix-Tiny.pm";
          description =
            "A small module to eliminate boilerplate overhead when using the Zabbix API";
          license = with prev.lib.licenses; [ artistic1 gpl1Plus ];
        };
      };

    });
  Rex = with prev.perlPackages;
    with final.perlPackages;
    buildPerlPackage {
      pname = "Rex";
      version = "a8520296d3a31a653ac76dd58c21819781346398";
      src = prev.fetchFromGitHub {
        owner = "Adjust";
        repo = "Rex";
        rev = "a8520296d3a31a653ac76dd58c21819781346398";
        sha256 = "y2bLIR4MchKmjy+ZYggrTuYwq1fSQzVEILL8GOJ7JQ0=";
      };
      setSourceRoot = ''
        (cd source && dzil build --in $NIX_BUILD_TOP/dist)
        export sourceRoot=$NIX_BUILD_TOP/dist'';
      checkInputs = [
        prev.which
      ];
      buildInputs = [
        prev.perl
        DistZilla
        DistZillaPluginMakeMakerAwesome
        DistZillaPluginMetaProvidesPackage
        DistZillaPluginOurPkgVersion
        DistZillaPluginOSPrereqs
        DistZillaPluginTestMinimumVersion
        DistZillaPluginTestPerlCritic
        FileShareDirInstall
        ParallelForkManager
        prev.shortenPerlShebang
        StringEscape
        TestDeep
        TestPod
        TestOutput
        TestUseAllModules
      ];
      propagatedBuildInputs = [
        AWSSignature4
        DataPrinter
        DataValidateIP
        DevelCaller
        DigestCRC
        DigestHMAC
        HTTPMessage
        HashMerge
        IOString
        IOTty
        JSONMaybeXS
        LWP
        ListMoreUtils
        NetCIDRLite
        NetOpenSSH
        NetSFTPForeign
        SearchElasticsearch
        SearchElasticsearchClient2_0
        SortNaturally
        TemplateToolkit
        TermProgressBar
        TermReadKey
        TextGlob
        TextTable
        URI
        URLEncode
        XMLSimple
        YAML
        ZabbixTiny
        autovivification
      ];
      postInstall = prev.lib.optionalString prev.stdenv.isDarwin ''
        shortenPerlShebang $out/bin/trex
        shortenPerlShebang $out/bin/trexify
      '';
      meta = {
        homepage = "https://www.rexify.org";
        description = "The friendly automation framework";
        license = prev.lib.licenses.asl20;
      };
    };
}
