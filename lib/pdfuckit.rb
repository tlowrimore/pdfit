require "pdfuckit/version"

module Pdfuckit
  class Error < StandardError; end

  class << self
    def exec(options)
      args = get_args(options)
      `pdftk #{args}`
    end

    private

    def get_args(options)
      join_dir  = options[:join_dir]
      out_dir   = options[:out_dir] || '.'
      password  = options[:password]

      [].tap do |args|
        args << join(join_dir) if join_dir
        args << "cat output #{out_dir}"
        args << "user_pw #{password}" if password
      end
      .join(" ")
    end

    def join(dir)
      files(dir).join(' ')
    end

    def files(dir)
      Dir.each_child(dir).flat_map do |f|
        fqfn = File.join(dir, f)
        if File.directory?(fqfn)
          files(fqfn)
        else
          fqfn
        end
      end
    end
  end
end
