#!/usr/bin/env ruby
require 'date'
###################################################
#                         iii          fff        #
#   aa aa pp pp   pp pp       nn nnn  ff    oooo  #
#  aa aaa ppp  pp ppp  pp iii nnn  nn ffff oo  oo #
# aa  aaa pppppp  pppppp  iii nn   nn ff   oo  oo #
#  aaa aa pp      pp      iii nn   nn ff    oooo  #
#         pp      pp                              #
###################################################
=begin appinfo
Shows keys from spotlight data for an app
usage: 'appinfo [app name]'

Keys for sizes are converted to human-readable numbers (e.g. 25.3MB)
Keys for dates are converted to localized short date format

=== Config
:use_imgcat: If you have iTerm2 and imgcat installed, print out an icon
:keys:       The keys to parse and their "pretty" form for printing Output in
             the order listed
==== Default keys:
'location' => 'Location',
'kMDItemCFBundleIdentifier' => 'Bundle ID',
'kMDItemPhysicalSize' => 'Size',
'kMDItemVersion' => 'Version',
'kMDItemContentCreationDate' => 'Released',
'kMDItemAppStorePurchaseDate' => 'Purchased',
'kMDItemLastUsedDate' => 'Last Used',
'kMDItemAppStoreCategory' => 'Category',
'kMDItemCopyright' => 'Copyright'

=end

CONFIG = {
  :use_imgcat => true,
  :keys => {
    'location' => 'Location',
    'kMDItemCFBundleIdentifier' => 'Bundle ID',
    'kMDItemPhysicalSize' => 'Size',
    'kMDItemVersion' => 'Version',
    'kMDItemContentCreationDate' => 'Released',
    'kMDItemAppStorePurchaseDate' => 'Purchased',
    'kMDItemLastUsedDate' => 'Last Used',
    'kMDItemAppStoreCategory' => 'Category',
    'kMDItemCopyright' => 'Copyright'
  }
}

def class_exists?(class_name)
  klass = Module.const_get(class_name)
  return klass.is_a?(Class)
rescue NameError
  return false
end

if class_exists? 'Encoding'
  Encoding.default_external = Encoding::UTF_8 if Encoding.respond_to?('default_external')
  Encoding.default_internal = Encoding::UTF_8 if Encoding.respond_to?('default_internal')
end

class Array
  def longest_element
    group_by(&:size).max.last[0].length
  end
end

class String
  def to_human(fmt=false)
    n = self.to_i
    count = 0
    formats = %w(B KB MB GB TB PB EB ZB YB)

    while  (fmt || n >= 1024) && count < 8
      n /= 1024.0
      count += 1
      break if fmt && formats[count][0].upcase =~ /#{fmt[0].upcase}/
    end

    format("%.2f",n) + formats[count]
  end
end

def find_app(app)
  location = nil
  res = %x{mdfind 'kind:app filename:"#{app}"' | grep -E '\.app$' | head -n 1}
  if class_exists? 'Encoding'
    res = res.force_encoding('utf-8')
  end
  if res && res.length > 0
    location = res.strip
  end
  return location.nil? ? false : location
end

def show_icon(app_path)
  if CONFIG[:use_imgcat] && File.exists?('/usr/local/bin/imgcat')
    app_icon = %x{defaults read "#{app_path}/Contents/Info" CFBundleIconFile}.strip.sub(/(\.icns)?$/,'.icns')
    res = %x{mkdir -p ${TMPDIR}appinfo && sips -s format png --resampleHeightWidthMax 125 "#{app_path}/Contents/Resources/#{app_icon}" --out "${TMPDIR}appinfo/#{app_icon}.png"} #  > /dev/null 2>&1
    $stdout.puts %x{imgcat "${TMPDIR}appinfo/#{app_icon}.png"  && rm "${TMPDIR}appinfo/#{app_icon}.png"}
  end
end

def parse_info(info)
  values = {}
  if class_exists? 'Encoding'
    info = info.force_encoding('utf-8')
  end
  info.split("\n").each {|line|
    sp = line.split(/\s*=\s*/)
    values[sp[0]] = sp[1].gsub(/"/,'')
  }
  values
end


def get_info(appname)
  app = appname.sub(/\.app$/,'')
  found = find_app(app)
  if found
    keys = "-name " + CONFIG[:keys].keys.join(' -name ')
    res = %x{mdls #{keys} "#{found}"}
    result = parse_info(res)
    result['location'] = found
    return result
  else
    $stdout.puts %Q{App "#{app}" not found.}
    Process.exit 1
  end
end

def info(app)
  appinfo = get_info(app)
  if appinfo && appinfo.length > 0
    longest_key = CONFIG[:keys].values.longest_element
    CONFIG[:keys].each {|k,v|
      key = v
      val = appinfo[k].strip
      val = case k
      when /Size$/
        val.to_human
      when /Date$/
        if appinfo[k].strip =~ /^\d{4}-\d{2}-\d{2}/
          Date.parse(val.strip).strftime('%D') rescue val
        end
      else
        val
      end

      val = val =~ /\(null\)/ ? "\033[0;36;40mUnknown\033[0m" : "\033[1;37;40m#{val}\033[0m"
      $stdout.puts "\033[0;32;40m%#{longest_key}s: %s" % [key, val]
    }
    show_icon(appinfo['location'])
  end
end

def exit_help(code=0)
  output =<<ENDOUT
Shows keys from Spotlight data for an app
Usage:

  #{File.basename(__FILE__)} [app name]

ENDOUT
  puts output
  Process.exit code.to_i
end

if ARGV.length == 0
  exit_help(1)
elsif ARGV[0] =~ /^-?h(elp)?$/
  exit_help
else
  info(ARGV.join(" "))
end
