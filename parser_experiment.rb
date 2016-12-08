class ParserExperiment < Parser::Rewriter
  def on_dstr(node)
    insert_before(node.loc.begin, "_(")
    insert_after(node.loc.end, ")")
  end

  def on_str(node)
    if node.loc.respond_to?(:heredoc_body)
      insert_before(node.loc.expression, "_(")
      insert_after(node.loc.expression, ")")
    else
      insert_before(node.loc.begin, "_(")
      insert_after(node.loc.end, ")")
    end
  end

  def on_send(node)
    if node.loc.selector.source == "_"
      return
    end
    super
  end
end

