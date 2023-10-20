---
title: Permutation_Entropy
date: 2023-03-08 22:05:12
---

{% raw %}


   <section data-toggle="wy-nav-shift" class="wy-nav-content-wrap"><nav class="wy-nav-top" aria-label="移动版导航菜单" >
          <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
          <a href="../../index.html">Entropy theory</a>
      </nav>

      <div class="wy-nav-content">
        <div class="rst-content">
          <div role="navigation" aria-label="页面导航">
  <ul class="wy-breadcrumbs">
      <li><a href="../../index.html" class="icon icon-home"></a></li>
      <li class="breadcrumb-item active">排列熵(Permutation Entropy)</li>
<li class="wy-breadcrumbs-aside">
   <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst" class="fa fa-github"> 在 GitHub 上编辑</a>
</li>

  </ul>
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="permutation-entropy">
<h1>Permutation Entropy<a class="headerlink" href="#permutation-entropy" title="此标题的永久链接"></a></h1>
<section id="id1">
<h2>Basic principle<a class="headerlink" href="#id1" title="此标题的永久链接"></a></h2>
<p>Has a time series <span class="math notranslate nohighlight">\(\left\{ {{x_1},{x_2}, \cdots ,{x_N}} \right\}\)</span> of length <span class="math notranslate nohighlight">\(N\)</span> , permutation entropy calculation steps are as follows:</p>
<ol class="arabic simple">
<li><p>Reconstruct the time series in phase space with embedding dimension <span class="math notranslate nohighlight">\(m\)</span>, Form the sequence of vectors <span class="math notranslate nohighlight">\(\left\{ {{x_1}\left( m \right),{x_2}\left( m \right), \cdots ,{x_{N - m + 1}}\left( m \right)} \right\}\)</span>, including:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[{x_i}\left( m \right) = \left\{ {x\left( i \right),x\left( {i + 1} \right), \cdots ,x\left( {i + m - 1} \right)} \right\},1 \le i \le N - m + 1 \tag{1}\]</div>
<ol class="arabic simple" start="2">
<li><p>The sequential pattern of the elements in each vector <span class="math notranslate nohighlight">\({x_i}\left(m \right)\)</span> is denoting as <span class="math notranslate nohighlight">\({\pi _j}\)</span>. If the embedding dimension is <span class="math notranslate nohighlight">\(m\)</span>, there are <span class="math notranslate nohighlight">\(m! \)</span> kind of sequential mode. Statistics for each sequential pattern <span class="math notranslate nohighlight">\(\left\{{{\pi _j}} \right\}_{j = 1}^{m! }\)</span> The probability of occurrence is denoted as:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[p\left( {{\pi _j}} \right) = \frac{{\left\| {i:i \le N - m + 1,type\left( {{x_i}\left( m \right)} \right) = {\pi _j}} \right\|}}{{N - m + 1}} \tag{2}\]</div>
<div class="admonition tip">
<p class="admonition-title">小技巧</p>
<p>For example, when <span class="math notranslate nohighlight">\(m = 3\)</span>, The elements in a vector are denoted from smallest to largest as <span class="math notranslate nohighlight">\(0,1,2 \)</span>, <span class="math notranslate nohighlight">\(m! = 6\)</span> Sequence mode <span class="math notranslate nohighlight">\((012,021,102,120,201,210)\)</span>. For the vector <span class="math notranslate nohighlight">\({x_1}\left(3 \right) = \left({8,12,6} \right),{x_2}\left(3 \right) = \left({9,3,8} \right)\)</span>, The sequential pattern with <span class="math notranslate nohighlight">\({x_1}\left(3 \right)\)</span> is <span class="math notranslate nohighlight">\(\pi = 120\)</span>, <span class="math notranslate nohighlight">\({x_2}\left(3 \right)\)</span> The sequential mode is <span class="math notranslate nohighlight">\(\pi = 201\)</span>.</p>
</div>
<ol class="arabic simple" start="3">
<li><p>Permutation entropy is defined as:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[PE\left( {m,N} \right) =  - \sum {p\left( {{\pi _j}} \right)\log p\left( {{\pi _j}} \right)}  \tag{3}\]</div>
<ol class="arabic simple" start="4">
<li><p>After normalization, it is:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[PE\left( {m,N} \right) =  - \frac{1}{{\log \left( {m!} \right)}}\sum {p\left( {{\pi _j}} \right)\log p\left( {{\pi _j}} \right)}  \tag{4}\]</div>
<div class="admonition note">
<p class="admonition-title">备注</p>
<p>The permutation entropy is proposed by Bandt et al. <a class="footnote-reference brackets" href="#id9" id="id2">1</a>, and the suggested parameters are as follows:</p>
<ul class="simple">
<li><p>Embedded dimension <span class="math notranslate nohighlight">\(m = 3 \sim 7\)</span>, in the subsequent simulation verification, Let's select <span class="math notranslate nohighlight">\(m = 6\)</span>.</p></li>
</ul>
</div>
</section>
<section id="id3">
<h2>Code implementation<a class="headerlink" href="#id3" title="此标题的永久链接"></a></h2>
<p>It is assumed that you have obtained all the code for this project, if you have not obtained the relevant program at this time, please go to  <a class="reference internal" href="../install.html"><span class="doc">Installation instructions</span></a></p>
<p>The core program of Permutation entropy is <code class="docutils literal notranslate"><span class="pre">MultiscalePermutationEntropy</span></code></p>
<div class="highlight-c++ notranslate"><div class="highlight"><pre><span></span><span class="n">function</span><span class="w"> </span><span class="n">MPE</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="n">MultiscalePermutationEntropy</span><span class="p">(</span><span class="n">data</span><span class="p">,</span><span class="n">m</span><span class="p">,</span><span class="n">t</span><span class="p">,</span><span class="n">scale</span><span class="p">)</span><span class="w"></span>
<span class="w">    </span><span class="n">MPE</span><span class="o">=</span><span class="p">[];</span><span class="w"></span>
<span class="w">   </span><span class="k">for</span><span class="w"> </span><span class="n">j</span><span class="o">=</span><span class="mi">1</span><span class="o">:</span><span class="n">scale</span><span class="w"></span>
<span class="w">       </span><span class="n">Xs</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="n">Multi</span><span class="p">(</span><span class="n">data</span><span class="p">,</span><span class="n">j</span><span class="p">);</span><span class="w"></span>
<span class="w">       </span><span class="n">PE</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="n">PermutationEntropy</span><span class="p">(</span><span class="n">Xs</span><span class="p">,</span><span class="n">m</span><span class="p">,</span><span class="n">t</span><span class="p">);</span><span class="w"></span>
<span class="w">       </span><span class="n">MPE</span><span class="o">=</span><span class="p">[</span><span class="n">MPE</span><span class="p">,</span><span class="n">PE</span><span class="p">];</span><span class="w"></span>
<span class="w">   </span><span class="n">end</span><span class="w"></span>
<span class="n">end</span><span class="w"></span>
</pre></div>
</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>The information of each input parameter is as follows:</p>
<ul class="simple">
<li><p><code class="docutils literal notranslate"><span class="pre">data</span></code>: The input time series is the column vector</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">m</span></code>: Embedding dimension</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">r</span></code>  : tolerance</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">scale</span></code> : scale ratio</p></li>
</ul>
</div>
</section>
<section id="id4">
<h2>Simulation verification<a class="headerlink" href="#id4" title="此标题的永久链接"></a></h2>
<section id="id5">
<h3>The result of pulse detection of permutation entropy<a class="headerlink" href="#id5" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="The result of pulse detection of permutation entropy" src="/assets/Downloads/单尺度脉冲检测结果/PE.emf.svg" />
</figure>
</section>
<section id="id6">
<h3>Visual results of fault classification based on multi-scale permutation entropy<a class="headerlink" href="#id6" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Visual results of fault classification based on multi-scale permutation entropy" src="/assets/Downloads/多尺度可视化结果/MultiPermutationEntropy.emf.svg" />
</figure>
</section>
<section id="id7">
<h3>Noise resistance analysis<a class="headerlink" href="#id7" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Noise resistance analysis" src="/assets/Downloads/抗噪性结果/PE.emf.svg" />
</figure>
</section>
<section id="id8">
<h3>Computational efficiency result<a class="headerlink" href="#id8" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Computational efficiency result" src="/assets/Downloads/计算效率结果/PE.emf.svg" />
</figure>
<dl class="footnote brackets">
<dt class="label" id="id9"><span class="brackets"><a class="fn-backref" href="#id2">1</a></span></dt>
<dd><ol class="upperalpha simple" start="3">
<li><p>Bandt and B. Pompe, “Permutation Entropy: A Natural Complexity Measure for Time Series,” Phys. Rev. Lett., vol. 88, no. 17, p. 174102, Apr. 2002, doi: 10.1103/PhysRevLett.88.174102.</p></li>
</ol>
</dd>
</dl>
</section>
</section>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="页脚">
        <a href="3%20Fuzzy%20entropy.html" class="btn btn-neutral float-left" title="模糊熵(Fuzzy entropy)" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> 上一页</a>
        <a href="5%20Diversity%20Entropy.html" class="btn btn-neutral float-right" title="散度熵(Diversity Entropy)" accesskey="n" rel="next">下一页 <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
    </div>

  <hr/>

 
   

</footer>
        </div>
      </div>
    </section>
    
	
	
	{% endraw %}
