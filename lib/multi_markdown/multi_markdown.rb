module MultiMarkdown
  # Markdown library names
  LIBRARIES = {
    :bluecloth     => 'bluecloth',
    :kramdown      => 'kramdown',
    :maruku        => 'maruku',
    :rdiscount     => 'rdiscount',
    :redcarpet     => 'redcarpet',
    :rpeg_markdown => 'peg_markdown'
  }

  # Markdown Constants
  CONSTANTS = {
    :bluecloth     => 'BlueCloth',
    :kramdown      => 'Kramdown::Document',
    :maruku        => 'Maruku',
    :rdiscount     => 'RDiscount',
    :redcarpet     => 'RedcarpetCompat',
    :rpeg_markdown => 'PEGMarkdown'
  }

  # The loading priority
  PRIORITY = [
    :redcarpet,
    :rdiscount,
    :kramdown,
    :bluecloth,
    :maruku,
    :rpeg_markdown
  ]

  @@markdown = nil

  #
  # Attempts to find the specific Markdown library.
  #
  # @param [Symbol] library
  #   The name of the markdown library.
  #
  # @raise [ArgumentError]
  #   Unknown Markdown library name.
  #
  # @raise [NameError]
  #   The constant for the Markdown library could not be found.
  #
  # @api semipublic
  #
  def self.find(library)
    unless CONSTANTS.has_key?(library)
      raise(ArgumentError,"unknown Markdown library: #{library}")
    end

    eval('::' + CONSTANTS[library])
  end

  #
  # Uses a specific Markdown library.
  #
  # @param [Symbol] library
  #   The name of the markdown library.
  #
  # @return [#new]
  #   The Markdown class.
  #
  # @raise [ArgumentError]
  #   Unknown Markdown library name.
  #
  # @raise [LoadError]
  #   The Markdown library could not be loaded.
  #
  # @raise [NameError]
  #   The constant for the Markdown library could not be found.
  #
  # @api semipublic
  #
  def self.use(library)
    unless LIBRARIES.has_key?(library)
      raise(ArgumentError,"unknown Markdown library: #{library}")
    end

    require LIBRARIES[library]

    @@markdown = find(library)
  end

  #
  # Attempts to find or load the first available Markdown library.
  #
  # @return [#new]
  #   The Markdown class.
  #
  # @raise [LoadError]
  #   None of the supported Markdown libraries could be found or loaded.
  #
  # @api semipublic
  #
  def self.load
    # attempt to find an already loaded markdown library
    PRIORITY.each do |library|
      begin
        return(@@markdown = find(library))
      rescue NameError
      end
    end

    PRIORITY.each do |library|
      begin
        return use(library)
      rescue Gem::LoadError => e
        # re-raise Gem::LoadErrors, as they are a sign of dependency issues
        raise(e)
      rescue LoadError
      end
    end

    raise(LoadError,"could not load any of the markdown libraries")
  end

  #
  # Loads the first available Markdown library and creates a Markdown document.
  #
  # @param [String] text
  #   Markdown text.
  #
  # @param [Hash{Symbol => Object}] options
  #   Additional options for the Markdown document.
  #
  # @return [#to_html]
  #   The Markdown document.
  #
  # @api public
  #
  def self.new(text,options={})
    load unless @@markdown

    @@markdown.new(text,options)
  end

end
