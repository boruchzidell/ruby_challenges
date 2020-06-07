#! /usr/bin/env ruby

CODONS = {
  'AUG' => 'Methionine',      'UUU' => 'Phenylalanine',
  'UUC' =>	'Phenylalanine',  'UUA' => 'Leucine',
  'UUG'	=> 'Leucine',         'UCU' => 'Serine',
  'UCC' => 'Serine',          'UCA' => 'Serine',
  'UCG'	=> 'Serine',          'UAU' => 'Tyrosine',
  'UAC'	=> 'Tyrosine',        'UGU' => 'Cysteine',
  'UGC'	=> 'Cysteine',        'UGG'	=> 'Tryptophan',
  'UAA' => 'STOP',            'UAG' => 'STOP',
  'UGA'	=> 'STOP'
}.freeze

class InvalidCodonError < StandardError; end

class Translation
  def self.of_codon(str)
    CODONS[str]
  end

  def self.of_rna(str)
    str
      .chars
      .each_slice(3)
      .map(&:join)
      .each { |string| raise InvalidCodonError if CODONS[string].nil? }
      .take_while { |codon| CODONS[codon] != 'STOP' }
      .map { |codon| CODONS[codon] }
  end
end
