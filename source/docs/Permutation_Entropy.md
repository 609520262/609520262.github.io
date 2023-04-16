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
<h1>排列熵(Permutation Entropy)<a class="headerlink" href="#permutation-entropy" title="此标题的永久链接"></a></h1>
<section id="id1">
<h2>基本原理<a class="headerlink" href="#id1" title="此标题的永久链接"></a></h2>
<p>设有长度为 <span class="math notranslate nohighlight">\(N\)</span>  的时间序列 <span class="math notranslate nohighlight">\(\left\{ {{x_1},{x_2}, \cdots ,{x_N}} \right\}\)</span> ，排列熵的计算步骤如下：</p>
<ol class="arabic simple">
<li><p>将时间序列进行相空间重构，嵌入维度为 <span class="math notranslate nohighlight">\(m\)</span> ，形成向量序列 <span class="math notranslate nohighlight">\(\left\{ {{x_1}\left( m \right),{x_2}\left( m \right), \cdots ,{x_{N - m + 1}}\left( m \right)} \right\}\)</span>  ，其中:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[{x_i}\left( m \right) = \left\{ {x\left( i \right),x\left( {i + 1} \right), \cdots ,x\left( {i + m - 1} \right)} \right\},1 \le i \le N - m + 1 \tag{1}\]</div>
<ol class="arabic simple" start="2">
<li><p>每个向量 <span class="math notranslate nohighlight">\({x_i}\left( m \right)\)</span>  内元素排列的顺序模式记为  <span class="math notranslate nohighlight">\({\pi _j}\)</span>。嵌入维度为 <span class="math notranslate nohighlight">\(m\)</span>，则一共有 <span class="math notranslate nohighlight">\(m!\)</span> 种顺序模式。统计每种顺序模式 <span class="math notranslate nohighlight">\(\left\{ {{\pi _j}} \right\}_{j = 1}^{m!}\)</span>  出现的概率，记为:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[p\left( {{\pi _j}} \right) = \frac{{\left\| {i:i \le N - m + 1,type\left( {{x_i}\left( m \right)} \right) = {\pi _j}} \right\|}}{{N - m + 1}} \tag{2}\]</div>
<div class="admonition tip">
<p class="admonition-title">小技巧</p>
<p>例如当 <span class="math notranslate nohighlight">\(m = 3\)</span> 时，向量内的元素由小到大记为  <span class="math notranslate nohighlight">\(0，1，2\)</span> ，共有 <span class="math notranslate nohighlight">\(m! = 6\)</span> 种顺序模式  <span class="math notranslate nohighlight">\((012,021,102,120,201,210)\)</span> 。对于向量  <span class="math notranslate nohighlight">\({x_1}\left( 3 \right) = \left( {8,12,6} \right),{x_2}\left( 3 \right) = \left( {9,3,8} \right)\)</span>，有 <span class="math notranslate nohighlight">\({x_1}\left( 3 \right)\)</span> 的顺序模式为 <span class="math notranslate nohighlight">\(\pi  = 120\)</span> ，<span class="math notranslate nohighlight">\({x_2}\left( 3 \right)\)</span> 的顺序模式为 <span class="math notranslate nohighlight">\(\pi  = 201\)</span> 。</p>
</div>
<ol class="arabic simple" start="3">
<li><p>排列熵定义为:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[PE\left( {m,N} \right) =  - \sum {p\left( {{\pi _j}} \right)\log p\left( {{\pi _j}} \right)}  \tag{3}\]</div>
<ol class="arabic simple" start="4">
<li><p>归一化处理后为:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[PE\left( {m,N} \right) =  - \frac{1}{{\log \left( {m!} \right)}}\sum {p\left( {{\pi _j}} \right)\log p\left( {{\pi _j}} \right)}  \tag{4}\]</div>
<div class="admonition note">
<p class="admonition-title">备注</p>
<p>排列熵是由Bandt等人 <a class="footnote-reference brackets" href="#id9" id="id2">1</a>，提出的，建议的参数选择为：</p>
<ul class="simple">
<li><p>嵌入维度  <span class="math notranslate nohighlight">\(m = 3 \sim 7\)</span>  ,在后续的仿真验证中，我们选择  <span class="math notranslate nohighlight">\(m = 6\)</span> 。</p></li>
</ul>
</div>
</section>
<section id="id3">
<h2>代码实现<a class="headerlink" href="#id3" title="此标题的永久链接"></a></h2>
<p>这里假设您已经获得本项目的的所有代码，若您此时还未获得有关程序，请移步到  <a class="reference internal" href="../install.html"><span class="doc">安装说明</span></a></p>
<p>排列熵(Permutation entropy)的核心程序为  <code class="docutils literal notranslate"><span class="pre">MultiscalePermutationEntropy</span></code></p>
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
<p>各输入参数的信息如下：</p>
<ul class="simple">
<li><p><code class="docutils literal notranslate"><span class="pre">data</span></code>：输入的时间序列，为列向量</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">m</span></code> :嵌入维度</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">r</span></code>  : 容限</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">scale</span></code> :尺度比</p></li>
</ul>
</div>
</section>
<section id="id4">
<h2>仿真验证<a class="headerlink" href="#id4" title="此标题的永久链接"></a></h2>
<section id="id5">
<h3>排列熵的脉冲检测结果<a class="headerlink" href="#id5" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="排列熵的脉冲检测结果" src="/assets/Downloads/单尺度脉冲检测结果/PE.emf.svg" />
</figure>
</section>
<section id="id6">
<h3>多尺度排列熵的故障分类可视化结果<a class="headerlink" href="#id6" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="多尺度排列熵的故障分类可视化结果" src="/assets/Downloads/多尺度可视化结果/MultiPermutationEntropy.emf.svg" />
</figure>
</section>
<section id="id7">
<h3>抗噪性分析<a class="headerlink" href="#id7" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="抗噪性分析" src="/assets/Downloads/抗噪性结果/PE.emf.svg" />
</figure>
</section>
<section id="id8">
<h3>计算效率结果<a class="headerlink" href="#id8" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="计算效率结果" src="/assets/Downloads/计算效率结果/PE.emf.svg" />
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
