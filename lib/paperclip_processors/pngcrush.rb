# To run the pngcrush command on PNG files output by Paperclip, you
# need to add
#
#   processors: [:thumbnail, :pngcrush]
#
# to your has_attached_file hash for each attachment in your project
# Thumbnail is the default paperclip processor, so you want to run that before
# pngcrush, which only minimizes PNG size and doesn't otherwise transform
# or crop image files

module Paperclip

  class Pngcrush < Processor

    attr_accessor :file, :options, :attachment

    def initialize file, options = {}, attachment = nil
      super
      @file = file
      @current_format = File.extname(@file.path)
      @basename = File.basename(@file.path, @current_format)
    end

    def make

      destination_file = Tempfile.new(@basename)
      destination_file.binmode

      begin

        success = Paperclip.run(
          "pngcrush", "-q -rem alla -reduce :source :dest",
          source: File.expand_path(@file.path),
          dest: File.expand_path(destination_file.path)
        )

      rescue Cocaine::ExitStatusError => e
        raise Paperclip::Error, "There was an error processing the thumbnail for #{@basename}" if @whiny
      rescue Cocaine::CommandNotFoundError => e
        raise Paperclip::Errors::CommandNotFoundError.new("Could not run the `pngcrush` command. Please install pngcrush.")
      rescue Exception => e
        Rails.logger.error "There was an error running `pngcrush` on the thumbnail for #{@basename}. Check that pngcrush is installed."
        Rails.logger.error e.message
      end

      return destination_file

    end

  end

end
