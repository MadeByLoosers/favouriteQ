from django.shortcuts import render_to_response

def current_question(request):
    # select a random poll
    #p = Poll.objects.order_by('?')[0]
    # redirect to voting page for that poll id
    #print 'test' + (str)p.id
    #return HttpResponseRedirect(reverse('poll_detail', args=(p.id,)))
    return render_to_response('questions/current_question.html')
    # {"results": results, "query": query}, context_instance=RequestContext(request)